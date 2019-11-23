---
date: 2019-03-21T20:44:17.000Z
public: true
title: Python
---

## How to select the right python version on Ubuntu 18.04?

```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
sudo update-alternatives --config python
```

Use the following command to set python 3.6 as default:

```
sudo update-alternatives  --set python /usr/bin/python3.6
```

## How to get started with Google Colab

https://towardsdatascience.com/getting-started-with-google-colab-f2fff97f594c

```
python

        import os
        os.listdir('.')
        for c in 'abc':
            print c

ipython
ipython notebook

        x = ! ls
        x[:3]
        x = ! ssh root@asdf.com ls
        x = ! ssh root@asdf.com cat /bin/lastsizes.txt
```

## How to install Pyenv and Anaconda?

<http://geek.oops.jp/2016/01/10/how-to-install-pyenv/>

<https://help.dreamhost.com/hc/en-us/articles/216137637-Pyenv-simple-Python-version-management>

```
    # Load pyenv automatically by appending
    # the following to ~/.config/fish/config.fish:

    status --is-interactive; and source (pyenv init -|psub)

    # List all possible version
    pyenv install --list
```

## What are so called coroutine in Python?

Coroutines are similar to generators with a few differences. The main
differences are: • generators are data producers • coroutines are data consumers

Source:

<http://book.pythontips.com/en/latest/coroutines.html>
