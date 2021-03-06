#!/bin/bash

# Install a cleanup handler
#CLEANUP_FILES=""
#trap do_file_cleanup EXIT KILL QUIT SEGV INT HUP TERM

usagel(){

echo "gitl -w|--week <string> -d|--dir <dirname> -f|--file <file-path>"

}

gitl(){

#set -x
	args=$(getopt -o "hw:d:f:" --long "help,week:,dir:,file:" -- "$@")
        [ $? -ne 0 ] && usagel && exit 255 2>/dev/null

        eval set -- "$args"

        while true; do
                case "$1" in
                        -h | --help)
                                usagel; exit 0; ;;
                        -w | --week)
				set -x
				git log --since=${2}.week --oneline
				{ set +x; } 2>/dev/null
				#break
                                shift;shift;
                                ;;
                        -d | --dir)
				set -x
				git log --pretty=format:"%h, %ar : %s : %cr" ${2}
				{ set +x; } 2>/dev/null
				#break
                                shift;shift;
                                ;;
                        -f | --file)
				set -x
				git log --pretty=format:"%h, %ar : %s : %cr" ${2}
				{ set +x; } 2>/dev/null
				#break
                                shift;shift;
                                ;;

                        --)
				#usagel
                                shift;break;
                                ;;
                        *)
                                usagel
                                exit 0;
                                ;;
               	esac
	done
#set +x
}






usage_q(){

echo "go -y|--yahoo <string> -m|--movie <movie> -e|--edx <subject> -g|--github <topic> -i|--image <name> -u|--youtube <vid>"

}

go(){

#set -x
	args=$(getopt -o "hy:m:e:g:i:u:" --long "help,yahoo:,movie:,edx:,github:image:youtube:" -- "$@")
        [ $? -ne 0 ] && usage_q && exit 255

        eval set -- "$args"

        while true; do
                case "$1" in
                        -h | --help)
                                usage_q; exit 0; ;;
                        -y | --yahoo)
				set -x
				gnome-open https://in.search.yahoo.com/search?p=${2}&fr=yfp-t&fp=1&toggle=1&cop=mss&ei=UTF-8
				set +x
				#break
                                shift;shift;
                                ;;
                        -u | --youtube)
				set -x
				gnome-open https://www.youtube.com/results?search_query=${2}
				set +x
				#break
                                shift;shift;
                                ;;
                        -m | --movie)
				set -x
				gnome-open https://3movierulz.mx/?s=${2}
				set +x
				#break
                                shift;shift;
                                ;;
                        -e | --edx)
				set -x
				gnome-open https://www.edx.org/course?search_query=${2}
				set +x
				#break
                                shift;shift;
                                ;;
                        -g | --github)
				set -x
				gnome-open https://github.com/search?q=${2}
				set +x
				#break
                                shift;shift;
                                ;;
                        -i | --image)
				set -x
https://www.google.co.in/search?hl=en&tbm=isch&sxsrf=ACYBGNRJETF4SCvvSyi9n-57PI78-K5y1A%3A1575057166685&source=hp&biw=1299&bih=588&ei=DnfhXcvOJ8KQ4-EPybiR-AU&q=${2}&oq=${2}&gs_l=img.3..0l7j0i131j0l2.2344.2679..3765...1.0..0.105.399.1j3......0....1..gws-wiz-img.yhGD4Mx07vc&ved=0ahUKEwjLja2XmZDmAhVCyDgGHUlcBF8Q4dUDCAY&uact=5
				set +x
				#break
                                shift;shift;
                                ;;
                        --)
				usage_q
                                shift;break;
                                ;;
                        *)
                                usage_q
                                exit 0
                                ;;
                esac
	done
#set +x
}

