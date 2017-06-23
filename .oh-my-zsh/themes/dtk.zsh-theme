# ZSH Theme (based on `bira`)

local return_code="%(?..%F{red}↦ %? %f)"

if [[ $UID -eq 0 ]]; then
    local user='%F{red}%n%f'
    local user_symbol='%B%F{red}#%f%b'
else
    local user='%F{blue}%n%f'
    local user_symbol='%F{blue}$%f'
fi

local host='%F{cyan}%m%f'
local current_dir='%F{magenta}%~%f'

local venv='$(virtualenv_prompt_info)'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%F{red}‹$(rvm-prompt i v g)›%f'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
  fi
fi
local git_branch='$(git_prompt_info)'
MODE_INDICATOR='-- NORMAL --'

PROMPT="╭─${user} at ${host} in ${current_dir}${venv}${rvm_ruby}${git_branch}
╰─${return_code}${user_symbol} "
RPS1='$(vi_mode_prompt_info)'
#RPS1=" [%*]"

ZSH_THEME_VIRTUALENV_PREFIX='%F{black}|'  # orange is the new black
ZSH_THEME_VIRTUALENV_SUFFIX='%f'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%f"
