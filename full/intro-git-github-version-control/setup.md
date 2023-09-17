# Part 0: Install and Configure Git

## Installing Git

On MacOS / Windows:
1.go to git-scm.com/downloads
2.download the software for Mac/Windows
3.install Git choosing all of the default options

On Linux:
```bash
sudo apt-get install git
```

## Configuring Git

Configure your git profile:

```bash
# sets up Git with your name
git config --global user.name "<Your-Full-Name>"
```

```bash
# sets up Git with your email
git config --global user.email "<your-email-address>"
```

```bash
# makes sure that Git output is colored
git config --global color.ui auto
```

```bash
# displays the original state in a conflict
git config --global merge.conflictstyle diff3
```

```bash
git config --list
```

Configure Git with you Code Editor:

Atom Editor Setup

```bash
git config --global core.editor "atom --wait"
```

Sublime Text Setup

```bash
git config --global core.editor "'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' -n -w"
```

VSCode Setup

```bash
git config --global core.editor "code --wait"
```
