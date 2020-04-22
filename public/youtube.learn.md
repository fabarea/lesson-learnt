---
date: 2019-03-21T10:39:18.000Z
title: Youtube
---

How to download a youtube 
==========================

Installation: prefer the pip package which is more up to date than the distribution package.

```sh
# Installation or upgrade with pip
pip install youtube-dl
pip install --upgrade youtube-dl
```

Examples with options:

```shell
# "best" quality will export the video 
# with a mid quality ration trading off the size and resolution
youtube-dl -f best --write-auto-sub --sub-lang fr https://youtu.be/bKueYVtV0eA
```

Working with **video** quality:

```shell
# Show possible encoding 
youtube-dl -F "https://youtu.be/bKueYVtV0eA" 

# Pick the righ quality and
# 22 = 1280x720 (which corresponsd to option "best")
youtube-dl -f 22 "https://youtu.be/bKueYVtV0eA" 
youtube-dl -f best "https://youtu.be/bKueYVtV0eA" 

# Write thumbnail at the same time
youtube-dl -f best --write-thumbnail "https://youtu.be/bKueYVtV0eA"
```

Working with **subtitle**:

```sh
# List all subtitle + auto-generated subtitle
youtube-dl --list-subs  "https://www.youtube.com/watch?v=1ukSR1GRtMU"

# Download *auto* generated subtitle in a particular language
youtube-dl --write-auto-sub --sub-lang fr "https://www.youtube.com/watch?v=1ukSR1GRtMU"

# Only download the subtitle file
youtube-dl --write-auto-sub --sub-lang fr --skip-download "https://www.youtube.com/watch?v=1ukSR1GRtMU"
```

Working with **audio**:

```shell
# Extract audio from youtube video
youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=ceLar7B1isg
```

How to download the Youtube thumbnail cover?
--------------------------------

Useful if youtube-dl is not installed on the system

<http://www.bernzilla.com/item.php?id=848>
Exemple: 
<http://img.youtube.com/vi/LiIboq6XCOg/2.jpg>

How to disable Ads?
-----------

Adblockers...