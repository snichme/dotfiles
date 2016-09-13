# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# Change this to your own username
DEFAULT_USERNAME='mange'

# Threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats '%b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

# enable prompt substitution
setopt PROMPT_SUBST

# Only show username if not default
[ $USER != $DEFAULT_USERNAME ] && local username='%n@%m '

# Fastest possible way to check if repo is dirty
git_dirty() {
  # check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # check if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '*'
}

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let local elapsed=$stop-$start
  [ $elapsed -gt $CMD_MAX_EXEC_TIME ] && echo ${elapsed}s
}

preexec() {
  cmd_timestamp=`date +%s`
}

git_info() {
  branch="$vcs_info_msg_0_"
  dirty=`git_dirty`
  if [ $dirty ]; then
    branch="$branch $dirty"
  fi
  [ $branch ] && echo " %f(%F{cyan}$branch%f)"
}
precmd() {
  vcs_info
}

PROMPT='%F{blue}%~%F{236}`git_info` %(?.%F{magenta}.%F{red})❯%f '