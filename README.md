s
===

s - Search from terminal

Installation
------------

### Install manually

* Clone this repository

```
git clone https://github.com/ssh0/s.sh.git ~/.zsh/plugins/s.sh
```

* Add the path of directory you clone the repository to `$PATH` and `$fpath` in your `~/.zshrc`

```zsh
PATH=$HOME/.zsh/plugins/s.sh:$PATH
fpath=($HOME/.zsh/plugins/s.sh $fpath)
```

### Using zsh plugin manager

* zplug

```
zplug "ssh0/s.sh"
```

* zgen

```
zgen load ssh0/s.sh
```

Usage
-----

```

NAME
      s - Search from terminal

USAGE
      s [-h|-l] <search_provider> <search queries>

OPTIONS
      -h    Show help message
      -l    Show search providers list
      -g    Force search in GUI browser

ENVIRONMENT VARIABLE:
      $BROWSERCLI     browser used in terminal
      $BROWSER        GUI browser

```

Providers
---------

|Alias |Providers                                 |
|---   |---                                       |
|    l |              Google - I'm feeling lucky! |
|    w |                                Wikipedia |
|    p |                             Google image |
|    m |                               Google Map |
|  mfh |   Google Map Navigation from Home to xxx |
|  mfw |   Google Map Navigation from Work to xxx |
|  mfh |   Google Map Navigation from xxx to Home |
|  mfw |   Google Map Navigation from xxx to Work |
|    n |                                 niconico |
|   nd |                      niconico dictionary |
|    y |                                  Youtube |
|   rt |                   Yahoo real time search |
|   ip |                               IP address |
|   tw |                                  twitter |
|   sc |                           Google Scholar |
|    q |                                    Qiita |
|    g |                            Github - repo |
|   gu |                            Github - user |
|   gc |                            Github - code |
|   gs |                                     Gist |
|    t |                      translate ja <-> en |
|   wd |                                  wordnik |
|  mpl |                 matplotlib documentation |
|  py2 |                 Python 2.7 documentation |
|  py3 |                 Python 3.4 documentation |
|  8tr |                                  8tracks |
|  arx |                                    arxiv |
|  dig |                                     Digg |
|   dg |                               duckduckgo |
|   gm |                                    Gmail |
|   g+ |                              Google Plus |
|   hn |                              Hacker News |
|  pin |                                Pinterest |
|  red |                                   Reddit |
|  sdc |                               SoundCloud |
|   so |                            Stackoverflow |
|  tor |                                  Torentz |
|   an |                               Anitube.se |
|   fb |                                 Facebook |

How to add providers
--------------------

FORMAT:

```
 +--- Line that matches with '^# \"' is used for printing providers lists.
 |   +--- After ': ' parts is also used for printing providers lists.
 |   |                      +--- After the second ': ' is real comment.
 |   |                      |
# "A": Some description here: This field is ignored by completion.
A,url,{true|false}
|  |    |
|  |    +--- Open in GUI browser or not.
|  +--- Set the search providers url. Search query is placed in "%s".
+--- Alias for the provider.
```

* Commeting line is used by zsh completion function [_s](./_s)

EXAMPLE:

```
# "m": Google Map: Search with Google Map and open page in GUI browser.
m,https://www.google.com/maps/place/%s,true
```

