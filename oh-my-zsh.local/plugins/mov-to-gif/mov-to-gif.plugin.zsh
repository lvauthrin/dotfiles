#autoload

function mov-to-gif() {
    local src="$1"
    local target=$src

    if [[ -z $src ]]; then
        echo -e "Please call '$0 --src <source video file>' to run this command\n"
        return 1
    fi

    local basename=${target%.*}
    [[ ${#basename} = 0 ]] && basename=$target
    target="$basename.gif"

    ffmpeg -i $src -r ${fps:=10} -vf ${resolution:='scale=960:-1'} -pix_fmt rgb8 $target #&& gifsicle -O3 "$target" -o "$target"
    osascript -e "display notification \"$target successfully converted and saved\" with title \"v2g complete\""
}

autoload -Uz mov-to-gif
