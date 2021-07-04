#!/usr/bin/env bash
cd `dirname $(pwd)/$0`
output_path="../e-hentai-downloader.user.js"
meta_js_path="../e-hentai-downloader.meta.js"
parts_js_dir="./"

# clear the bundle
echo "" >"$output_path"

find "$parts_js_dir" -maxdepth 1 -follow -type f -print | sort -V | while read -r f; do
    case "$f" in
        *.js)
            cat "$f">>"$output_path"
            ;;
        *) echo "$0: Ignoring $f";;
    esac
done

browserify "$output_path" -o "$output_path"
