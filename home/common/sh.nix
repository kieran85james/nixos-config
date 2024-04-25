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

    # # reload bash config
    "reload" = "source ~/.bashrc";

    # # NixOS
    "nix-update" = "nix flake update";
    "nix-rebuild" = "sudo nixos-rebuild switch --flake . && home-manager switch --flake .";
  };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
    initExtra = ''
      tty -s && export PS1="\[\033[38;5;35m\]\t [\[\033[38;5;33m\]\j\[\033[38;5;35m\]] [\h:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput setaf 3)\]\[\033[38;5;35m\]]\n\\[\033[38;5;35m\]🦄 \[$(tput sgr0)\]"
    '';
  };
}