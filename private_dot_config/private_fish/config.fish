if status is-interactive
    ############################################################################
    #### Auto start TMUX
    if not set -q TMUX
        tmux new-session -A -s main
    end

    ############################################################################
    #### Homebrew Configuration

    # add 'sbin' to path, fish does not include 'sbin' by default
    fish_add_path /usr/local/sbin

    ############################################################################
    #### User Scripts (Applications)
    fish_add_path /Users/$USER/Applications

    ############################################################################
    #### Rust Lang (it must go before ASDF, because ASDF will prepend too)
    set -gx --prepend PATH "$HOME/.cargo/bin"

    ############################################################################
    #### ASDF Configuration
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
    end
    set --erase _asdf_shims

    ############################################################################
    #### AWS Configuration

    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    ############################################################################
    #### Starship Configuration
    starship init fish | source

    ############################################################################
    #### Aliases

    # clear tmux and screen history
    abbr -a cls "tmux clear-history && clear"

    # A command to restart cloudflared service
    abbr -a cloudflared_reinstall "sudo cloudflared service uninstall && sudo cloudflared service install"

    # Python 3 alias
    abbr -a py python

    # ProperTree (plist editor)
    abbr -a propertree ~/Applications/ProperTree/ProperTree.command

    # Network aliases
    abbr -a dns_DoH_Start "sudo launchctl start com.cloudflare.cloudflared"
    abbr -a dns_DoH_Stop "sudo launchctl stop com.cloudflare.cloudflared"
    abbr -a dns_DoH_WiFi_Set "networksetup -setdnsservers 'Wi-Fi' 127.0.0.1"
    abbr -a dns_DoH_WiFi_Unset "networksetup -setdnsservers 'Wi-Fi' 9.9.9.10 149.112.112.10 2620:fe::10 2620:fe::fe:10"
    abbr -a dns_DoH_Thunderbolt_Set "networksetup -setdnsservers 'Thunderbolt Ethernet' 127.0.0.1"
    abbr -a dns_DoH_Thunderbolt_Unset "networksetup -setdnsservers 'Thunderbolt Ethernet' 9.9.9.10 149.112.112.10 2620:fe::10 2620:fe::fe:10"
    abbr -a dns_DoH_Test "dig google.com @127.0.0.1"
    abbr -a dns_Reset_Cache "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

    # Homebrew aliases
    abbr -a brup "brew update && echo '- -' && brew outdated && echo '- -' && brew outdated --cask --greedy"
    abbr -a brug "brew upgrade && brew upgrade --cask --greedy && brew cleanup"

    # Git aliases
    abbr -a g git

    abbr -a ga git add
    abbr -a gaa git add --all
    abbr -a gapa git add --patch
    abbr -a gau git add --update
    abbr -a gav git add --verbose
    abbr -a gap git apply
    abbr -a gapt git apply --3way

    abbr -a gb git branch
    abbr -a gba git branch -a
    abbr -a gbd git branch -d
    abbr -a gbD git branch -D
    abbr -a gbl git blame -b -w
    abbr -a gbnm git branch --no-merged
    abbr -a gbr git branch --remote
    abbr -a gbs git bisect
    abbr -a gbsb git bisect bad
    abbr -a gbsg git bisect good
    abbr -a gbsr git bisect reset
    abbr -a gbss git bisect start

    abbr -a gc git commit -v
    abbr -a gcb git checkout -b

    abbr -a gco git checkout

    abbr -a gf git fetch

    abbr -a gd git diff
    abbr -a gdca git diff --cached
    abbr -a gdcw git diff --cached --word-diff
    abbr -a gds git diff --staged

    abbr -a glg git log --stat
    abbr -a glgp git log --stat -p
    abbr -a glgg git log --graph
    abbr -a glgga git log --graph --decorate --all
    abbr -a glgm git log --graph --max-count=10
    abbr -a glo git log --oneline --decorate

    abbr -a gm git merge

    abbr -a gp git push

    abbr -a gr git remote
    abbr -a gra git remote add
    abbr -a grb git rebase
    abbr -a grba git rebase --abort
    abbr -a grbc git rebase --continue

    abbr -a gst git status

    abbr -a gu git pull
end
