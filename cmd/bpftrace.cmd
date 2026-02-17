# Description
bpftrace 是建立在 Linux 的 eBPF 基礎上的一個高階追蹤工具，其原理主要依賴於內核提供的探針機制（probes），例如 kprobes、tracepoints 以及 uprobes。

# Overview
1. eBPF 與 bpftrace 的關係
    * eBPF（extended BPF）：是 Linux 內核中一項強大的技術，允許用戶加載並執行沙盒內核程式（BPF 程式），這些程式可以安全地在內核上下文中運行，收集運行時的數據，而不會危害系統穩定性。
    * bpftrace：是一個高階的腳本語言和工具，它將用戶寫的追蹤腳本轉換為 eBPF bytecode，再通過內核的 BPF 子系統加載並運行這些程式。

2. 探針機制（Probes）的運作方式
    * kprobes 與 tracepoints：內核提供了這些機制，允許用戶在內核函式的入口或出口（甚至是某些特定的內核事件點）“掛鉤”。當內核執行到這些位置時，事先註冊的 BPF 程式就會被觸發。
    * 如何知道函式被呼叫：例如，當你使用 bpftrace 寫下類似 kprobe:tcp_connect 的腳本時，bpftrace 會將這個腳本編譯成對應的 eBPF bytecode，並通過內核的 kprobe 機制將該程式掛載到 tcp_connect 函式的入口點。當內核執行到 tcp_connect 時，掛在該位置的 eBPF 程式就會被調用，自然就「知道」這個函式被呼叫了。

* eBPF provide sandbox for user to run code in kernel, and kprobe hooks the eBPF byte code to a specific function

* compare
    方法        適用場景	優點                缺點
    bpftrace	快速調試	簡單易用	        不適用於高頻事件
    BCC	      更複雜的分析	可寫 Python 腳本	需要安裝 BCC
    perf	    性能分析	無需 BPF	        影響較大，需 root 權限

* compare
    * kstack = kernel backtrace
        * 使用 eBPF helper: bpf_get_stackid(ctx, 0)
    * ustack = user backtrace
        *  使用: bpf_get_stackid(ctx, BPF_F_USER_STACK)
    * eBPF manager 程式
        * BCC, bpftrace, perf, libbpf

* CONFIG_DEBUG_INFO_BTF
    * this config means if BTF is enabled in yout kerenl.
        * or we can check if /sys/kernel/btf/vmlinux exists
    * bpftrace can still work even without BTF in kernel, but we can't analyze kernel parameters


# Options

# Example
$ sudo bpftrace -l "tracepoint:amdgpu:*"
    * list all tracepoint matching the pattern
    * avaliable tracepoints are listed in /sys/kernel/tracing/available_events

$ sudo bpftrace -e '
kprobe:amdgpu_bo_create
{
  printf("BO create by %s (pid %d)\n", comm, pid);
  print(kstack);
}'
    * kprobe, use for quickly check call path

$ sudo bpftrace -e '
tracepoint:amdgpu:amdgpu_bo_create
{
  printf("BO size=%llu domain=%d pid=%d\n",
         args->size, args->preferred_domains, pid);
}'
    * ftrace, better than kprobe for checking arguments

* BCC python script
    ```
    from bcc import BPF

    bpf_text = """
    int trace_tcp_connect(struct pt_regs *ctx) {
        bpf_trace_printk("tcp_connect called!\\n");
        bpf_trace_printk("Kernel stack:\\n");
        bpf_trace_printk("%s", bpf_get_stack(ctx, NULL, 0, BPF_F_USER_STACK));
        return 0;
    }
    """

    b = BPF(text=bpf_text)
    b.attach_kprobe(event="tcp_connect", fn_name="trace_tcp_connect")

    print("Tracing... Press Ctrl+C to stop.")
    b.trace_print()
    ```
    * if seeing error of kheaders not found
        * bpftrace can work without BTF, but BCC is old and require BTF
        * if no BTF (CONFIG_DEBUG_INFO_BTF is not set), then it will search kernel headers, but also not found
            * if system has BTF, we should see /sys/kernel/btf/vmlinux

* use perf to print backtrace
    $ sudo perf record -g -e kprobe:do_sys_open
    $ sudo perf script
