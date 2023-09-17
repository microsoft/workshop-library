# Part 0: Install and Configure Git

As with any tool, we need to install and configure it before we can use it.

## Installing Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. If you don't already have Visual Studio Code installed, you can install it by doing the following:

On MacOS / Windows:
1. Go to [git-scm.com/downloads](https://git-scm.com/downloads/?wt.mc_id=studentamb_71460).
2. Download the software for Mac/Windows.
3. Install Git choosing all of the default options.

On Linux, execute the following command:
```bash
sudo apt-get install git
```

## Configuring Git

Open Git bash and execute the following Commands:

1. Configure your Git profile.

    ```bash
    # sets up Git with your name
    git config --global user.name "<Your-Full-Name>"
    ```

    ```bash
    # sets up Git with your email
    git config --global user.email "<your-email-address>"
    ```

2. Configure your UI output color.

    ```bash
    # makes sure that Git output is colored
    git config --global color.ui auto
    ```

3. Configure Git with your code editor:

    i. For Atom editor, execute the following command:

    ```bash
    git config --global core.editor "atom --wait"
    ```

    ii. For VSCode, execute the following command:

   ```bash
   git config --global core.editor "code --wait"
   ```

4. Review all the configuration options.

    ```bash
    # lists all the configuration properties 
    git config --list
    ```

## Summary

Now, you have successfully installed and configured Git. The next step is to practice [working with a local repository](./local-git.md).
