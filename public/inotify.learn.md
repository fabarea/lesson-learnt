---
title: Inotify - file watcher
---

# Inotify

It works well. Argument `-e` has multiple event type such as `modify`, `close_write` etc...

## What examples is there?

One liner:

```
while inotifywait -e close_write *.cpp; do make; done
```

With a more verbouse output on the console:

```
inotifywait -q -m -e close_write *.cpp |
while read -r filename event; do
  echo "File changed ${filename}. Compiling..."
  echo ""
  make
  echo ""
done
```

## Other examples with directory

Some other examples from https://superuser.com/questions/181517/how-to-execute-a-command-whenever-a-file-changes

```
inotifywait -e close_write,moved_to,create -m . |
while read -r directory events filename; do
  if [ "$filename" = "myfile.py" ]; then
    ./myfile.py
  fi
done
```
