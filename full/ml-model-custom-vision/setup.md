# Part 0: Install and configure tools

As with any project, a few tools are going to be needed. In particular you'll need a code editor, an Azure subscription, and a couple of keys for Custom Vision.

## Installing the editor

Visual Studio Code is an open source code editor which can be used to create nearly any project type with any programming language. If you don't already have Visual Studio Code installed, you can install it by visiting [code.visualstudio.com](https://code.visualstudio.com). You will also need the [Pylance extension](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance), which will provide additional functionality when writing Python.

## Obtaining the starter project

A starter project has been provided which includes the images for the workshop and the solution code. To obtain the project:

1. Navigate to [https://github.com/microsoft/workshop-library/](https://github.com/microsoft/workshop-library/)
1. Select **Use this template** to create a copy of the repository in your GitHub account
1. Name the new repository **workshop-library**
1. Select **Create repository from template**
1. When the new repository opens, select **Code**
1. Select the **Local** tab and then the **Copy** button

    ![Copy icon](./images/copy.png)

1. Open a terminal or command window and execute the following, replacing \<URL\> with the URL you copied in the prior step

    ```bash
    # Windows
    git clone <URL>
    cd workshop-library\full\ml-model-custom-vision
    code .

    # Linux, WSL or macOS
    git clone <URL>
    cd workshop-library\full\ml-model-custom-vision
    code .
    ```

## Enrolling with Azure for Students

Azure for Students offers $100 US in free credit to be used across 12 months and a host of free services - including Custom Vision! If you don't already have an Azure subscription, you can enroll with [Azure for Students](https://azure.microsoft.com/free/students) by using your school email address. If your email address doesn't work, please ask your instructor for a code.

## Creating keys

To use Custom Vision, you'll need two keys:

- a training key, used to create the model
- a prediction key, used to make predictions based on the model

We'll create these keys by using the Azure portal.

1. Navigate to [portal.azure.com](https://portal.azure.com)
1. Select **Create a resource**
1. Search for **Custom Vision** and press enter
1. Select **Custom Vision** from the list of services
1. Select **Create**
1. For **Create Options** ensure **Both** is selected
1. Under **Project Details** configure the following:
    1. For **Subscription** select your Azure for Students subscription
    1. For **Resource Group** select **Create new**, enter **custom-vision** for the name, and select **OK**
1. Under **Instance Details** configure the following:
    1. For **Region** select a region near you
    1. For **Name**, provide a unique name such as **custom-vision-your-name**, replacing **your-name** with your name
1. For both **Training pricing tier** and **Prediction pricing tier** select **Free F0**
1. Select **Review + create**
1. Select **Create**

## Summary

You now have all the necessary tools for creating and using a custom vision model. The next step is to [train the model](./train.md).
