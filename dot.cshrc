# $FreeBSD: releng/10.1/share/skel/dot.cshrc 266029 2014-05-14 15:23:06Z bdrewery $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

[ "$TERM" = xterm ] && setenv TERM xterm-256color
setenv	LANG	ja_JP.UTF-8

alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF

alias bye	logout
alias adios	logout
alias chao	logout

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin $HOME/.local/bin)
setenv	BLOCKSIZE	K
# A righteous umask
umask 22

setenv	EDITOR	vi
setenv	PAGER	less
setenv	PYTHONPATH	~/.local/lib/python3.7/site-packages

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "%N@%m:%~ %# "
	set prompt = "%# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif
