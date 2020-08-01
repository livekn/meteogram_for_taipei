#!/bin/bash

photo_url="https://www.yr.no/place/Taiwan/Taipei/Taipei/avansert_meteogram.png"
photo_caption=`date "+%Y-%m-%d"`

if ! [[ -f config ]]
then
	echo "please add config"
	exit 1
fi

source ./config

if ! [[ -n $token ]] || ! [[ -n $chat_id ]]
then
	echo "config error"
	exit 2
fi

request_url="https://api.telegram.org/bot"$token"/sendPhoto"

photo_url=$photo_url"?time="`date +%s`	# so that Telegram won't use a cached version

curl --url $request_url --data-urlencode "chat_id=$chat_id" --data-urlencode "photo=$photo_url" --data-urlencode "caption=$photo_caption"

printf "\nDone\n"
