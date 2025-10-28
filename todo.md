# Todo

## Changes

- [x] Setup session support
- [x] Setup better markdown support
- [x] Add fuzzy find config folder
- [x] Setup terminal short keys
- [x] Setup avante.nvim
- [x] Add support for better log grepping
  - [x] Grep current file - works out of the box with <leader>sb
  - [x] Grep open files - works out of the box with <leader>sB
  - [x] Send output to quickfix list - works out of the box with Ctrl-q
  - [x] Send output to new buffer - fixed - works best with <leader>sb - Press Ctrl-x to send to new buffer
- [x] Find out why cursor sometimes moves backwards - caused by folding fix in features.lua
- [ ] Setup plantuml.nvim

## Bugs

- [x] Fix keyboard mapping for Picker - Ctrl-w curently clears the search result - not an issue, use Alt-w instead
- [x] Find out why ESC does not work in INSERT mode

## Test

- [ ] Support for multiple projects (search, lsp)
  - [ ] Setup neoconf.nvim
