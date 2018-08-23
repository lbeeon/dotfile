export PATH="/usr/local/opt/python/libexec/bin:$PATH"
set -g -x PATH /Users/ben_wang/Library/Python/2.7/bin $PATH
set -g -x PATH /usr/local/lib/python3.6/site-packages $PATH
set -g -x PATH /usr/local/bin $PATH
# set -x PATH /usr/local/opt/gnupg/libexec/gpgbin $PATH
  [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
# begin
#     set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
#     if test -e $AUTOJUMP_PATH
#         source $AUTOJUMP_PATH
#     end
# end

set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH
set -x GOOGLE_APPLICATION_CREDENTIALS /Users/ben/.secret/credential.json
set -x GOOGLE_PROJECT_ID pristine-abacus-90205
set -x PUBSUB_EMULATOR_HOST localhost:8344
set -x DATASTORE_EMULATOR_HOST localhost:8432
set -x DATASTORE_PROJECT_ID pristine-abacus-90205
set -x NVIMRC $HOME/.config/nvim/init.vim


set tacklebox_path ~/.tackle
set tacklebox_modules virtualfish virtualhooks
set tacklebox_plugins extract grc pip python up
set tacklebox_theme entropy
source ~/.tacklebox/tacklebox.fish

#set -x VIM /usr/share/vim
#set -x VIMRUNTIME /usr/share/vim/runtime

# Load fishmarks (http://github.com/techwizrd/fishmarks)
#. $HOME/.fishmarks/marks.fish

alias vi "nvim"
# alias node "node --harmony-async-await"


# function vi
#   nvim $argv
# end

function gits
        git status
end

function gitcc
  git branch -D test; git branch -D stag; git branch -D prod
end

function gitccr
  git push origin -d test; git push origin -d stag; git push origin -d prod
end

function gitt
  git branch -D test; git checkout -b 'test'
end

function gitci
  git push origin -d test
  git push origin test
end

function gclogin
	docker login -u _token -p (gcloud auth print-access-token) https://asia.gcr.io
end

eval (hub alias -s)

function bump
	set base_string (cat VERSION)
	set base_list (echo $base_string | tr '.' '\n')
#	echo $base_list
	set v_major $base_list[1]
	set v_minor $base_list[2]
	set v_patch $base_list[3]
#	echo $v_patch
	set v_patch (math $v_patch+1)
#	echo $v_patch
	set suggested_version $v_major.$v_minor.$v_patch
	echo $suggested_version

	read -l -p "echo 'Enter a version number' [$suggested_version]" input_string

	if [ $input_string = "" ]
		set input_string $suggested_version
	end

	echo 'Set new version to : '$input_string
	echo $input_string > VERSION
	git add VERSION
	git commit -S -m "Version bump to $input_string"
	git tag -a -m "Tagging version $input_string" "v$input_string"
	git push origin --tags
end

function gc_stage
	set -x GOOGLE_APPLICATION_CREDENTIALS /Users/ben/.secret/credential.json
	set -x GOOGLE_PROJECT_ID pristine-abacus-90205
end

function gc_product
	set -x GOOGLE_APPLICATION_CREDENTIALS /Users/ben/.secret_product/credential.json
	set -x GOOGLE_PROJECT_ID instant-matter-785
end

function demu_pubsub
 	set --erase PUBSUB_EMULATOR_HOST
end

function demu_datastore
  set --erase DATASTORE_EMULATOR_HOST 
  set --erase DATASTORE_PROJECT_ID
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ben/.gcloud/path.fish.inc' ]; if type source > /dev/null; source '/Users/ben/.gcloud/path.fish.inc'; else; . '/Users/ben/.gcloud/path.fish.inc'; end; end

# Paths to your tackle
# set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# Load Tacklebox configuration
# . ~/.tacklebox/tacklebox.fish
# source ~/.tacklebox/tacklebox.fish

# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

test -s /Users/ben_wang/.nvm-fish/nvm.fish; and source /Users/ben_wang/.nvm-fish/nvm.fish

nvm use default
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
