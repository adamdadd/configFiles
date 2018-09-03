#!/usr/bin/env sh

#kill all conky process that might be running previously
killall -q conky

#launch conky System monitor
conky -c ~/.conkyrc &

#launch conky rss
conky -c ~/.conkyrssrc
