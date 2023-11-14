# Part 2: Working with Remotes

While working locally may seem enough for some people sometimes we need to collaborate with others so, this is where a remote place to store our code comes into place, and our remote is GitHub a cloud platform used to share code with others and collaborate on projects.

## Creating a GitHub Repository

1. In the upper-right corner of any page, use the ➕ drop-down menu, and select **New repository**.

    ![Screenshot of a GitHub dropdown menu showing options to create new items. The menu item "New repository" is outlined in dark orange.](https://docs.github.com/assets/cb-31554/mw-1440/images/help/repository/repo-create.webp)

2. Type a short, memorable name for your repository. For example, "hello-world".

    ![Screenshot of the first step in creating a GitHub repository. The "Repository name" field contains the text "hello-world" and is outlined in dark orange.](https://docs.github.com/assets/cb-61138/mw-1440/images/help/repository/create-repository-name.webp)

3. Optionally, add a description of your repository. For example, "My first repository on GitHub."

4. Choose a repository visibility. For more information, see "[About repositories](https://docs.github.com/repositories/creating-and-managing-repositories/about-repositories#about-repository-visibility)".

5. Select **Initialize this repository with a README**.

6. Select **Create repository**.

## Cloning a Git Repository Locally

1. Above the list of files, select **<> Code**.

    ![Screenshot of the list of files on the landing page of a repository. The "Code" button is highlighted with a dark orange outline.](https://docs.github.com/assets/cb-32892/mw-1440/images/help/repository/code-button.webp)

2. Copy the HTTPS URL for the repository.

    ![Screenshot of the "Code" dropdown menu. To the right of the HTTPS URL for the repository, a copy icon is outlined in dark orange.](https://docs.github.com/assets/cb-45942/mw-1440/images/help/repository/https-url-clone-cli.webp)

3. Inside Git Bash, execute the following command replacing the URL with the URL you copied earlier

    ```bash
    git clone https://github.com/YOUR-USERNAME/hello-world
    ```

This command:
- takes the path to an existing repository
- by default will create a directory with the same name as the repository 
that's being cloned
- can be given a second argument that will be used as the name of the 
directory
- will create the new repository inside of the current working directory


## Uploading Changes to GitHub and Downloading them

1. Inside Git Bash, execute the following command to change the directory to the newly cloned repository's directory

    ```bash
    cd hello-world
    ```

2. Inside Git Bash, execute the following command to make some changes

    ```bash
    echo "My first sentence on GitHub." > new-file.txt
    ```

3. Inside Git Bash, execute the following command to add the changes

    ```bash
    git add .
    ```

4. Inside Git Bash, execute the following command to add the changes

    ```bash
    git commit -m "Initial commit"
    ```

5. Inside Git Bash, execute the following command to push the changes to GitHub

    ```bash
    git push
    ```

6. Inside your GitHub repository, make any changes to anyfile you want using GitHub's UI. (For example, edit the *README.md* file)

7. Inside Git Bash, execute the following command to pull the changes from GitHub.

    ```bash
    git pull
    ```

## Contributing on GitHub

1. Visit this repository [john0isaac/git-workshop-pr](https://github.com/john0isaac/git-workshop-pr/?wt.mc_id=studentamb_71460).
2. In the top-right corner of the page, click **Fork**.
3. Select **Create fork**.
4. Clone the repository locally.
5. Make changes to the repository by adding your name to the contribution list.
6. Add, Commit, and Push your changes.
7. Go back to the forked version of the repository on GitHub.
8. Select **Contribute** followed by **Open a pull request** to add your changes to the original repository.
9. Select **Create pull request**.
10. Enter a **Title** for your pull request. For example, YOUR-NAME contribution.
11. Select **Create pull request**.

## Summary

Congratulations! You have successfully created and cloned a GitHub repository. The repository you created can be shared with anyone which enables you to collaborate with others. You have also made your first contribution to another project. If you want to continue to grow your skills:

- Learn more about [GitHub on Microsoft Learn](https://learn.microsoft.com/training/github/?wt.mc_id=studentamb_71460).
- Finish [Introduction to version control with Git](https://learn.microsoft.com/training/paths/intro-to-vc-git/?wt.mc_id=studentamb_71460) learning path.
