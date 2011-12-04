muon-cli
=================

muon-cli - work time catcher

Instalation
===========

```
gem install muon-cli
```

Usage
=====

Add your work time
```
muon add -m 'Fix tests' -p 'MyProject' -t '20 minutes'
```

After that just commit to api-server
```
muon commit
```

You can also edit ~/.muon/history file with your favorite editor.

Example File
============

```
"20 minutes","Project name","Description"
"3 hours","Another project name","Description"
```

And after edit just
```
muon commit
```

