#! /bin/bash

# Revision history
# 5.0  - Split up into fragments
#      - Remove unused notify, stop exporting unnecessary variables
#      - Remove private functions and variables from the namespace
#      - Make non-GNU color ls work
# 4.1  - Remove archaic terminal stuff and move remainder to .termrc
#      - We now expect all ttys to set TERM to something sane by default
#      - We now use 256-color terminals whenever available
# 4.0  - Elide archaic systems, fix up for illumos-based systems
# 3.5  - Clean up 32/64 bit stuff now that everyone else has
# 3.4  - And Solaris.
# 3.3  - And IRIX also. :-)
# 3.2  - Add back in i686-linux support
#      - The name is changed to sparc32
# 3.1  - Nuke solaris support, we no longer use it
# 3.0  - Scrap everything I have lost contact with
# 2.10 - Add support for vrpad and sgi-linux
# 2.02 - Add support for decstations with NetBSD
# 2.01 - Add support for honors-i386-linux
# 2.00 - Merge in all non-IRIX stuff
# 1.99 - Don't do stty if noninteractive (duh)
# 1.98 - Cat /etc/motd iff nonlogin shell
# 1.97 - Run cleanup
# 1.91 - Bring in old bash_profile stuff
# 1.90 - Strip non-ECC stuff
# 1.47 - Add skeleton path for su-ing under slowaris
# 1.44 - Move TERM stuff here and reorder
# 1.41 - Fix little-noticed root #/$ bug
# 1.40 - Use non-deprecated backquoting mechanism
#      - Remove blender environment
#      - Redo Java environment
#      - Remove MPI environment
# 1.36 - Begin history

umask 022

#
# Inverted sense -- we return 0 ("success") if interactive.
#
function __is_inter {
	[ -n "${-//[^i]/}" ] && return 0
	return 1
}

PATH=/bin:/usr/bin
_BASE_DIR="$HOME/.bash.d"

if ! [ -d "$_BASE_DIR" -a -r "$_BASE_DIR" ]; then
	__is_inter && \
	    echo "Missing $_BASE_DIR.  Environment setup may be incomplete."
fi

for __f in $_BASE_DIR/[0-9]*; do
	[ -r "$__f" ] && . "$__f"
done

#
# Remove all private functions so they can't confuse the user.
#
for __f in $(declare -F | cut -d' ' -f 3); do
	[ -z "${__f/__*/}" ] && unset -f $__f
done

#
# Likewise for all private variables.
#
for __v in $(declare | cut -d= -f1); do
	[ -z "${__v/__*/}" ] && unset $__v
	[ -z "${__v/_[A-Z]*/}" ] && unset $__v
done

unset __v
