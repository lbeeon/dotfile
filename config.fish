set -g -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/opt/gnupg/libexec/gpgbin $PATH

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

set -x GOPATH $HOME/go
#set -x GOROOT /usr/local/Cellar/go/1.7.3
#set -x PATH $GOPATH/bin $GOROOT/bin $PATH
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

#set -x VIM /usr/share/vim
#set -x VIMRUNTIME /usr/share/vim/runtime

# Load fishmarks (http://github.com/techwizrd/fishmarks)
#. $HOME/.fishmarks/marks.fish

alias vi "nvim"
alias node "node --harmony-async-await"


# function vi
#   nvim $argv
# end

function gits
        git status
end

function gclogin
	docker login -u _token -p (gcloud auth print-access-token) https://asia.gcr.io
end

# The next line updates PATH for the Google Cloud SDK.
bass source '/Users/ben/.gcloud/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '/Users/ben/.gcloud/completion.bash.inc'

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
