# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [[ -f $config && ${config:e} != "zwc" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

export AWS_DEFAULT_REGION=‘us-east-1’
export AWS_REGION='us-east-1'
export AWS_ACCESS_KEY_ID=key
export AWS_SECRET_ACCESS_KEY=secrets
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export ORACLE_HOME=/usr/local/opt/oracle-instant-client
export DYLD_LIBRARY_PATH=/usr/local/opt/oracle-instant-client/lib
export PATH=/opt/apache-maven-3.6.1/bin:$PATH

STRAP_BIN_DIR=~/src/strap/bin
if [ -d $STRAP_BIN_DIR ]; then
 PATH=“$STRAP_BIN_DIR:${PATH}”
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ting/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ting/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ting/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ting/node_modules/tabtab/.completions/sls.zsh
