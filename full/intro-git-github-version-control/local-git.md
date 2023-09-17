# Part 1: Working with a Local Repository

Git tracks changes in your source code, enables versioning, and supports non-linear development through thousands of parallel branches without the need for the internet.

## Initializing a Local Git Repository

1. On your local machine, create a new empty folder.
2. Right-click inside the folder and select **Git Bash Here** from the options.

    ![Git Bash Here Screenhot](./images/git-bash-here.png)

3. Inside git bash, execute the following command to initialize a Git repository
   
    ```bash
    git init
    ```

## Making Changes

Common shell commands:
  ```bash
  $ ls    # used to list files and directories
  $ mkdir # used to create a new directory
  $ cd    # used to change directories
  $ rm    # used to remove files and directories
  $ pwd   # used to print the current working directory
  $ touch # used to create and modify files
  ```

## Staging Changes

$ git add

## Committing Changes

$ git commit

## Reviewing the Repository's History

$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
$ git log

$ git log --oneline
• the SHA 
• the author 
• the date
• the commit message

## Summary

Congratulations! You are now able to use Git on your local machine to manage your projects. Next you'll practice [working with remotes](./remote-github.md).
