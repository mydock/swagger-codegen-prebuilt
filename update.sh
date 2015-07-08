#!/bin/bash
set -e

cd "$(dirname $BASH_SOURCE)"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

for version in "${versions[@]}"; do
	src="Dockerfile.template"
	trg="$version/Dockerfile"
	( set -x && sed 's/xVERSIONx/'"$version"'/g' "$src" > "$trg" )	
done

