let
  myAliases = {
    ".." = "cd ..";
    "..." = "cd ../../../";
    "...." = "cd ../../../../";
    "back" = "cd $OLDPWD";
    "cd.." = "cd ..";
    "df" = "df -h -x squashfs -x tmpfs -x devtmpfs";
    "e" = "vim -O";
    "E" = "vim -o";
    "egrep" = "egrep --colour=auto";
    "grep" = "grep --color=auto";
    "ll" = "ls -lah --time-style=long-iso --color=auto";
    "ls" = "ls -lhF --color=auto --human-readable --time-style=long-iso --classify";
    "lsmount" = "mount |column -t";
    "mkdir" = "mkdir -pv";
    "ports" = "netstat -tulanp";
    "h" = "history -i 1";
    "history" = "history 1";
    "j" = "jobs -l";
    "rmdir" = "rmdir -v";
    "speedtest" = "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -";
    "ssha" = "eval $(ssh-agent) && ssh-add";
    "svim" = "sudo vim";
    "tn" = "tmux new -s";
    "watch" = "watch -d";
    "weather" = "curl wttr.in";
    "wget" = "wget -c";

    # ## get top process eating memory
    "mem5" = "ps auxf | sort -nr -k 4 | head -5";
    "mem10" = "ps auxf | sort -nr -k 4 | head -10";

    # ## get top process eating cpu ##
    "cpu5" = "ps auxf | sort -nr -k 3 | head -5";
    "cpu10" = "ps auxf | sort -nr -k 3 | head -10";

    # ## List largest directories (aka "ducks")
    "dir5" = "du -cksh * | sort -hr | head -n 5";
    "dir10" = "du -cksh * | sort -hr | head -n 10";

    # # Safetynets
    # # do not delete / or prompt if deleting more than 3 files at a time #
    "rm" = "rm -Iv --preserve-root";

    # # confirmation #
    "mv" = "mv -iv";
    "cp" = "cp -iv";
    "ln" = "ln -iv";

    # # Parenting changing perms on / #
    "chown" = "chown --changes --preserve-root";
    "chmod" = "chmod --changes --preserve-root";
    "chgrp" = "chgrp --changes --preserve-root";

    # # NixOS
    "nix-update" = "nix flake update";
    "nix-rebuild" = "sudo nixos-rebuild switch --flake .#$HOSTNAME && home-manager switch --flake .";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases // {"reload" = "source ~/.bashrc";};
    historyControl = ["ignorespace"];
    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
      "cdspell"
    ];
    initExtra = ''
      tty -s && export PS1="\[\033[38;5;35m\]\t [\[\033[38;5;33m\]\j\[\033[38;5;35m\]] [\h:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput setaf 3)\]\[\033[38;5;35m\]]\n\\[\033[38;5;35m\]🦄 \[$(tput sgr0)\]"
    '';
    bashrcExtra = ''
      HISTTIMEFORMAT="%Y-%m-%d %T "

      export TERM=xterm-256color
      export EDITOR=nano

      # Show system information at login
      if [ -t 0 ]; then
          if type -p "neofetch" > /dev/null; then
              neofetch
          else
              echo "Warning: neofetch was called, but it's not installed."
          fi
      fi

      # Add /home/$USER/bin to $PATH
      case :$PATH: in
        *:/home/$USER/bin:*) ;;
        *) PATH=/home/$USER/bin:$PATH ;;
      esac

      # Add /home/$USER/.local/bin to $PATH
      case :$PATH: in
        *:/home/$USER/.local/bin:*) ;;
        *) PATH=/home/$USER/.local/bin:$PATH ;;
      esac

      # bash functions
      # Make a directory, then go there
      md() {
          test -n "$1" || return
          mkdir -p "$1" && cd "$1"
      }

      # "path" shows current path, one element per line.
      # If an argument is supplied, grep for it.
      path() {
          test -n "$1" && {
              echo $PATH | perl -p -e "s/:/\n/g;" | grep -i "$1"
          } || {
              echo $PATH | perl -p -e "s/:/\n/g;"
          }
      }

      extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjvf $1    ;;
            *.tar.gz)    tar xzvf $1    ;;
            *.tar.xz)    tar xvf $1    ;;
            *.bz2)       bzip2 -d $1    ;;
            *.rar)       unrar2dir $1    ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip2dir $1     ;;
            *.Z)         uncompress $1    ;;
            *.7z)        7z x $1    ;;
            *.ace)       unace x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()"   ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }
    '';
  };
}