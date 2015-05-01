# export LANG="ja_JP.utf8"
export LANG="C"
export LV='-Ou8'
export PERL_BADLANG=0

export PAGER=lv
bindkey -e
#bindkey -v

if [ "$TERM" != "dumb" ]; then
    if whence dircolors >/dev/null; then
        eval "$(dircolors -b)"
        zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
        alias ls='ls --color'
    else
        export CLICOLOR=1
        zstyle ':completion:*:default' list-colors ''
    fi
fi

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

alias ll='ls -l'
alias la='ls -la'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

autoload -U compinit ; compinit
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1 
zstyle ':completion:*' use-cache true        
zstyle ':completion:*:processes' command 'ps x'

setopt list_packed           
#setopt auto_remove_slash     
unsetopt auto_remove_slash
setopt auto_param_slash      
setopt mark_dirs             
setopt list_types            
unsetopt menu_complete       
setopt auto_list             
setopt auto_menu             
setopt auto_param_keys       
setopt auto_resume           

#setopt auto_correct          
#setopt correct               
#setopt correct_all           

autoload -U predict-on       
zle -N predict-on
zle -N predict-off
bindkey '^xp'  predict-on    
bindkey '^x^p' predict-off   

HISTFILE=$HOME/.zsh_history  
HISTSIZE=100000              
SAVEHIST=100000              
setopt extended_history      
#unsetopt extended_history
setopt append_history        
setopt inc_append_history    
setopt share_history         
setopt hist_ignore_all_dups  
setopt hist_ignore_dups      
setopt hist_ignore_space     
unsetopt hist_verify         
setopt hist_reduce_blanks    
setopt hist_save_no_dups     
setopt hist_no_store         
setopt hist_expand           

function history-all { history -E 1 }

autoload -U promptinit ; promptinit
autoload -U colors     ; colors
PROMPT="%{$reset_color%}$ "
PROMPT="%{$reset_color%}[%{$fg[red]%}%B%~%b%{$reset_color%}]$PROMPT"
PROMPT="%{$reset_color%}%{$fg[green]%}$USER%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}$PROMPT"

PROMPT="%n@%m:%(5~,%-2~/.../%2~,%~)%% "
setopt auto_cd               
setopt auto_pushd            
setopt pushd_ignore_dups     
setopt pushd_to_home         
setopt pushd_silent          
# pop command
alias pd='popd'
alias gd='dirs -v; echo -n "select number: ";
read newdir; cd +"$newdir" '

#setopt AUTOLOGOUT=n        
setopt no_beep              
#setopt beep

setopt complete_in_word
setopt extended_glob        
setopt brace_ccl            
setopt equals               
setopt numeric_glob_sort    
setopt path_dirs            
setopt print_eight_bit      
setopt auto_name_dirs

unsetopt flow_control       
setopt no_flow_control      
setopt hash_cmds            

setopt ignore_eof           

setopt bsd_echo
setopt no_hup               
#setopt no_checkjobs        
setopt notify               
setopt long_list_jobs       

setopt magic_equal_subst    
setopt mail_warning
setopt multios              
setopt short_loops          
#setopt sun_keyboard_hack   
setopt always_last_prompt   
setopt cdable_vars sh_word_split

#setopt rm_star_wait         
setopt rm_star_silent        
#setopt no_clobber           
unsetopt no_clobber

setopt no_unset              

#setopt interactive_comments 
#setopt chase_links          
#setopt print_exit_value     
#setopt single_line_zle      
#setopt xtrace               

LESS=-M
export LESS
if type /usr/bin/lesspipe &>/dev/null
then
LESSOPEN="| /usr/bin/lesspipe '%s'"
LESSCLOSE="/usr/bin/lesspipe '%s' '%s'"
export LESSOPEN LESSCLOSE
fi

umask 022 
ulimit -s unlimited  
limit coredumpsize 0 
export G_FILENAME_ENCODING=@locale

precmd() {
[[ -t 1 ]] || return
case $TERM in
sun-cmd) print -Pn "\e]l[%~]\e\\"
 ;;
*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;[%~]\a"
 ;;
esac
}

# Global alias
# alias -g L='| less'
alias -g L="| $PAGER"
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'

alias -s html=google-chrome

# alias
alias e='emacs'
alias h='history'
alias ha='history-all'

alias htmlconv='sed -e "s/</\&lt;/g;s/>/\&gt;/g;s/\t/\&nbsp;\&nbsp;\&nbsp;\&nbsp;/g;s/\s/\&nbsp;/g" '

_acroread_version='7.0.9'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \

export PATH=$PATH:$HOME/bin:
export PATH=/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin:$PATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%s:%b]'
zstyle ':vcs_info:*' actionformats '[%s:%b(%a)]'

# print vcs status 
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

