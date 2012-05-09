DIRS = \
	.bash.d \
	.terminfo.d \
	.terminfo.d/73 \
	.terminfo.d/78 \
	.terminfo.d/s \
	.terminfo.d/x \
	.vim.d \
	.vim.d/syntax

FILES = \
	.bash.d/00.functions \
	.bash.d/03.timezone \
	.bash.d/05.system \
	.bash.d/10.path \
	.bash.d/15.terminfo \
	.bash.d/20.terminal \
	.bash.d/30.editor \
	.bash.d/60.aliases \
	.bash.d/70.shell \
	.bash.d/80.prompt \
	.bash.d/85.vim \
	.bash.d/90.mail \
	.bash.d/95.cleanup \
	.bash_profile \
	.bashrc \
	.gitconfig \
	.inputrc \
	.mailcap \
	.muttrc \
	.screenrc \
	.terminfo.d/73/screen-256color \
	.terminfo.d/78/xterm-256color \
	.terminfo.d/s/screen-256color \
	.terminfo.d/x/xterm-256color \
	.tmux.conf \
	.vim.d/syntax/json.vim \
	.vimrc

HOME_DIRS=$(DIRS:%=$(HOME)/%)
HOME_FILES=$(FILES:%=$(HOME)/%)

install: $(HOME_FILES)

$(HOME_FILES): $(HOME_DIRS)

$(HOME_DIRS):
	mkdir -p $(HOME_DIRS)

$(HOME)/%: %
	-rm -f $@
	cp $< $@
