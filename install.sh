#!/bin/sh

# caterm installer
# in ministall format
# licenced under unlicence, see LICENCE for details

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root!"
  exit 1
fi

mkdir -p /usr/share/caterm/
mkdir -p /usr/share/man/man1/

cat > /usr/share/caterm/caterm.sh <<'EOF'
alias caterm='>_<<run; sh _; rm _'
EOF
echo "Installed /usr/share/caterm/caterm.sh (uses sh)"

cat > /usr/share/caterm/caterm.zsh <<'EOF'
alias caterm='>_<<run; zsh _; rm _'
EOF
echo "Installed /usr/share/caterm/caterm.zsh (uses zsh)"

cat > /usr/share/caterm/caterm.bash <<'EOF'
alias caterm='>_<<run; bash _; rm _'
EOF
echo "Installed /usr/share/caterm/caterm.bash (uses bash)"

cat > /usr/share/caterm/caterm.py3.sh <<'EOF'
alias caterm='>_<<run; python3 _; rm _'
EOF
echo "Installed /usr/share/caterm/caterm.py3.sh (uses python3)"

cat > /usr/share/caterm/LICENSE <<'EOF'
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>
echo "Installed /usr/share/caterm/LICENSE (Unlicense)"

cat > /usr/share/man/man1/caterm.1 <<'EOF'
.TH CATERM 1 "2025-06-06" "1.2" "General Commands Manual"
.SH NAME
caterm \- the one-liner terminal

.SH SYNOPSIS
.B caterm

.SH DESCRIPTION
caterm is a minimalist, ephemeral shell alias that lets you write and run temporary
shell scripts using a heredoc. The alias looks like a kaomoji >_<.

You write your script, end with the word "run", and it executes the code in a
temporary file which is then deleted.

.SH USAGE
Example:

.nf
$ caterm
echo "hello world"
run
hello world
.fi

.SH INSTALLATION
Add the following line to your shell config (e.g. ~/.zshrc):

.nf
source /usr/share/caterm/caterm.sh
.fi

Or add one of the following aliases directly, replacing with your preferred shell:

.nf
alias caterm='>_<<run; sh _; rm _'       # uses sh
alias caterm='>_<<run; zsh _; rm _'      # uses zsh
alias caterm='>_<<run; bash _; rm _'     # uses bash
alias caterm='>_<<run; python3 _; rm _'  # uses python3
.fi

Each alias script is installed to /usr/share/caterm/ with a file extension indicating the interpreter.

.SH FILES
/usr/share/caterm/caterm.sh       (sh alias)
/usr/share/caterm/caterm.zsh      (zsh alias)
/usr/share/caterm/caterm.bash     (bash alias)
/usr/share/caterm/caterm.py3.sh   (python3 alias)
/usr/share/caterm/LICENSE         (license text)
/usr/share/man/man1/caterm.1      (man page)

To uninstall, remove these files and remove any references in your shell rc files.

.SH LICENSE
This software is released under The Unlicense. See /usr/share/caterm/LICENSE
for details or visit <https://unlicense.org>

.SH AUTHOR
Inspired by cursed shell energy. Made by theoddcell (https://oddcell.ca/)

.SH BUGS
If the file "_" already exists, it will be overwritten without warning.
Not intended for permanent scripts.

.SH SEE ALSO
sh(1), zsh(1), bash(1), cat(1)
EOF

echo "Installed man page: /usr/share/man/man1/caterm.1"

echo "Done!"
