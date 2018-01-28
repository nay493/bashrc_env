#!/bin/bash

# Install a cleanup handler
CLEANUP_FILES=""
trap do_file_cleanup EXIT KILL QUIT SEGV INT HUP TERM

function usage {
local tmpcmd="petalinux-package --sysroot"
        echo "Commmand \"${tmpcmd}\" installs eSDK to default location.
Usage:
  ${tmpcmd} [options]

Required:
  --sysroot					Install SDk using default installer at default directory

Options:
  --help|-h					Display help messages
  --sdk|-s <Custom SDK installer path>          Custom SDK installer path
  --dir|-s <Custom directory path>		Custom directory path

EXAMPLES:
1. Default location
  $ petalinux-package --sysroot

2. Custom location
  $ petalinux-package --sysroot --sdk|-s <Custom SDK installer path> --dir|-d <Custom directory path>"

}

bada_kon() {
	local regenargs=()
	while [ $# -gt 0 ]; do
	regenargs[${#regenargs[@]}]="$1"
		case $1 in
			-f | --file | -d | --dir)
				if [[ "$2" =~ ^-.* ]] || [ $# -eq 1 ]; then
					regenargs[${#regenargs[@]}]="DEFAULT"
				fi
				;;
			*)
				;;
		esac
		shift
	done

	args=$(getopt -o "hf:d:" --long "help,file:,dir:" -- "${regenargs[@]}")
	[ $? -ne 0 ] && usage && exit 255

	eval set -- "$args"

	while true; do
		case "$1" in
			-h | --help)
				usage; exit 0; ;;
			-f | --file)
				grep -E '\b[[:upper:]]+\b=' "${2}"
				shift;shift;
				;;
                        -d | --dir)
                                grep -RnHE '\b[[:upper:]]+\b=' "${2}"
                                shift;shift;
                                ;;

			--)
				shift;break;
				;;
			*)
				usage
				exit 0
				;;
		esac
	done
}

#parse_args "$@"

usage_p(){

echo "apply_allp -a|--apply -m|--am <directory>"

}

apply_allp(){

set -x
	args=$(getopt -o "ha:m:" --long "help,apply:,am:" -- "$@")
        [ $? -ne 0 ] && usage && exit 255

        eval set -- "$args"

        while true; do
                case "$1" in
                        -h | --help)
                                usage_p; exit 0; ;;
                        -a | --apply)
				patches=$(ls -1tr "${2}")
				for i in "${patches[@]}"
				do					
					git apply "${2}/${i}"
				done
                                shift;shift;
                                ;;
                        -m | --am)
				patches=$(ls -1tr "${2}")
				for i in "${patches[@]}"
				do
					git am "${2}/${i}"
				done	
                                shift;shift;
                                ;;

                        --)
				usage_p
                                shift;break;
                                ;;
                        *)
                                usage_p
                                exit 0
                                ;;
                esac
	done
set +x
}
