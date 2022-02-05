# lorem-nvim
Lorem Ipsum generator in lua.

## Installation
Download using your preffered package manager or use instructions below.
<details>
  <summary>Vim-Plug</summary>

1. Install [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
2. Add plugin to vim plug in `vimrc`.
```vim
call plug#begin()
  Plug 'mbpowers/lorem-nvim'
call plug#end()
```
3. Add keybinding in `vimrc`.
  
`nmap <leader>l <Plug>Lorem`
  
4. Restart nvim, and run `:PlugInstall`.
</details>

## Use
The command will take a count. For example, if the key is mapped to `<leader>l`:

|      input    |  output |
|---------------|---------|
| \<leader\>l   | Nunc.   |
| 5\<leader\>l  | Platea malesuada varius placerat quisque.|
| 50\<leader\>l | Nisi mi elementum ut non vivamus netus, maecenas efficitur vivamus quam. Nunc etiam lacus vehicula consectetur malesuada, donec ornare. Habitasse sollicitudin suspendisse elementum ornare integer, finibus aliquet dui eu. Facilisi duis, primis etiam habitasse efficitur finibus turpis ante efficitur nibh metus. Erat est nunc odio tempus imperdiet rhoncus mattis aliquet. |

## Configuration
The frequency of punctuation is determined by these variables:

| option               | default |
|----------------------|---------|
| g:lorem#commamin     |   5     |
| g:lorem#commamax     |   11    |
| g:lorem#periodmin    |   6     |
| g:lorem#periodmax    |   14    |
| g:lorem#paragraphmin |   4     |
| g:lorem#paragraphmax |   10    |
  
A counter for each type of punctuation is set randomly between the min and max value of that type.
Each word the period and comma counters decrement. Each sentence the paragraph counter decrements.
If the count reaches 0 the punctuation is added and the counter will be reset to a random value between the min and max.
  
There is also the option which sets the location of the word list:
  
| option            | default                                          |
|-------------------|--------------------------------------------------|
| g:lorem#wordslist | /home/user/.config/nvim/plugged/lorem-nvim/words |

The word list should be a file with one lowercase word per line.
  
You can set these in your `init.vim`:

```vim
let g:lorem#wordspath = "/home/user/path/to/file/"
let g:lorem#commamin = 5
let g:lorem#commamax = 11
let g:lorem#periodmin = 6
let g:lorem#periodmax = 14
let g:lorem#paragraphminin = 4
let g:lorem#paragraphmax = 10
  ```





