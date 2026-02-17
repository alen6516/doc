
* keyboard shortcut in Windows
    * https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf


* C:\Users\haopiliu\AppData\Roaming\Code\User\setting.json
    ```
    "editor.fontSize": 16,
    "C_Cpp.dimInactiveRegions": false,
    "editor.stickyScroll.enabled": false,
    "terminal.integrated.copyOnSelection": true
    ```

* C:\Users\haopiliu\AppData\Roaming\Code\User\keybindings.json
    ```
    {
        "key": "ctrl+]",
        "command": "editor.action.revealDefinition",
        "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
    },
    {
        "key": "ctrl+t",
        "command": "workbench.action.navigateBack",
        "when": "editorTextFocus && canNavigateBack"
    }
    ```

* install neovim externsion instead of vim
    * backspace key doesn't work in vscode vim

* C:\Users\haopiliu\AppData\Local\nvim\init.lua
    * Vscode by default read neovim config here
    ```
    vim.keymap.set("n", "<C-h>", "9h", { noremap = true, silent = true }) -- Left
    vim.keymap.set("n", "<C-l>", "9l", { noremap = true, silent = true }) -- Right
    vim.keymap.set("n", "<C-j>", "9j", { noremap = true, silent = true }) -- Down
    vim.keymap.set("n", "<C-k>", "9k", { noremap = true, silent = true }) -- Up
    ```
        * moving more than 9 lines makes vscode to treat it as a jump, alt+LeftArrow will be affected
