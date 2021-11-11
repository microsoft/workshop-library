# Part 1: Train your model

A custom vision model 

## Create the project

A project is a custom vision model. It's used to label images with the appropriate tag (or category), and perform the training. Let's start by creating a project.

1. Navigate to [Custom Vision](https://www.customvision.ai?WT.mc_id=academic-49102-chrhar) and sign in
1. Select **New Project**
1. Enter **Dog Classification** for the project name
1. Next to Resource, select the key you created earlier, which will use the name you created during the [setup](setup.md).
1. For **Project Types** select **Classification**
1. For **Classification Types** select **Multiclass**, as our dogs will only have one breed
1. For **Domains** select **General \[A2\]**
1. Select **Create project**

## Upload images

Once the project is created it's time to upload images. These images are used to train the model.

> **Tip**: As a general rule, the more images you can use to train a model the better. You want to include as much variety in the images as possible, including different lighting, angles, and settings.

1. Select **Add images**
1. Navigate to **training-images**
1. Select all the images marked as **american-staffordshire-terrier** in the folder, and select **Open**
1. Enter **american-staffordshire-terrier** for the tag and select **Upload 8 files**
1. Select **Done**
1. Repeat the above steps for the remaining breeds:
    - **australian-shepherd**
    - **buggle**
    - **german-wirehaired-pointer**
    - **shorkie**
1. Select **Train** to open the training dialog
1. Leave **Quick Training** selected and select **Train** to begin the training process

> **Note**: Training the model will take a couple of minutes.

## Summary

Congratulations! You have trained up a custom vision model which can detect dog types. Next you'll [test and use the model](./predict.md).
