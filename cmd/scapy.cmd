# Description

# Overview
* use git clone https://github.com/secdev/scapy.git to obtain scapy, not apt install
    * run scapy/run_scapy

* IPv6 packet refer to https://www.packetlevel.ch/html/scapy/scapyipv6.html

# Options

    
# Example
$ lsc()
    * show avaliable command

$ ls(IP)
    * find parameters of IP protocol

$ help(PacketSend)
    * see how to use PacketSend

$ p = IP(dst="8.8.8.8")/TCP(dport=80)/"GET / HTTP/1.1"
    ## make a packet
    ether = Ether()
    ether.show()    /* check each field */
    ether.src = "00:0c:29:0a:5d:10"
    ether.dst = "00:0c:29:0a:5d:1a"

	## icmpv6
	icmpv6 = ICMPv6EchoRequest()
	ipv6 = IPv6(dst="2001:2::162")
	pkt = (ipv6/icmpv6)
	sr1(pkt)

	## encap
    ipv6 = IPv6()
    ip = IP()
    icmp = ICMP()
    pkt = ether/ipv6/ip/icmp

    ## write to pcap
    wrpcap(filename, pkt, append=True)

	## read from pcap
	pkts = rdpcap("test.pcap")
    for pkt in pkts:
		if pkt.haslayer(UDP):
			pkt.show()

$ send(p)

$ res = sr(p)
    * send packet p and receive the reply in res
    * res store both the sent packet and its reply in a nested list, using type() to analyze this structure

$ pkt.haslayer(UDP)
    * check if pkt has UDP layer

$ pkt.getlayer(UDP)
    * get UDP header from pkt

* script to send ipv6 with different src ip:
	pkts = []
	for i in range(20):
		p = Ether()/IPv6(src="2001:1::"+str(i), dst="2001:2::162")/UDP(sport=9487, dport=9000)
		pkts.append(p)
	sendp(pkts, iface="ens19", loop=1000, verbose=False)

* make a fragmented udp packet (3 packets)
	pl = []	
	ip = IP()
	ip.frag = 0
	ip.flags = 1 # MF
	udp = UDP()
	udp.sport = 9487
	udp.dport = 9000
	p = ip/udp/("data"*20)
	pl.append(p)
	ip.frag = 10
	ip.proto = 17 # UDP
	p = ip/("data"*20)
	pl.append(p)
	ip.frag=20
	ip.flags = 0
	p = ip/("finish")
	pl.append(p) 
