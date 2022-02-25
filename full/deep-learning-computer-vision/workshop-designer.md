
# UBD: Understanding By Design

The UBD technique of curriculum design was created by Jay McTighe and Grant Wiggins and outlined in their book, "[Understanding By Design](https://www.amazon.com/Understanding-Design-second-Grant-Wiggins/dp/B006NPF8D0/ref=sr_1_15?crid=26FTBZ6E9Q53K&keywords=understanding+by+design&qid=1636052567&sprefix=understanding+by+design%2Caps%2C94&sr=8-15)". UBD is a process of "backwards design" where the curriculum designer works through three stages, starting with the desired goals of the learning experience and moving backwards through assessments and then to the lesson design. It bears some similarities to TDD (test-driven development) processes in Engineering, where tests are to be written before the code. Use this template to outline your workshop's desired outcomes.

## Introduction to Deep Learning for Computer Vision

## Workshop Source 

* [Introduction to Computer Vision with PyTorch](https://docs.microsoft.com/learn/modules/intro-computer-vision-pytorch/?WT.mc_id=academic-56313-dmitryso)
* [Introduction to Computer Vision with Tensorflow](https://docs.microsoft.com/learn/modules/intro-computer-vision-tensorflow/?WT.mc_id=academic-56313-dmitryso)

## Stage 1: Desired Results 

1. Students will learn:
  - How deep neural networks work
  - How convolutional neural networks (CNNs) can "understand" images
  - How to train a CNN to classify images
1. Students will be able to independently use their learning to:
  - Train their own image classification network from scratch and (optionally) using transfer learning

## Stage 2: Evidence
 
Expected results:

 - Learners should be able to achieve around 50% accuracy (around 80% top-3) on Pet Faces dataset when training from scratch
 - Accuracy using transfer learning should be around 85% on original Oxford Pets dataset (around 96% top-3)

## Stage 3: Learning Plan

1. Start Learn module with the sandbox notebook, download the dataset (Pet Faces) to the sandbox
1. Convert dataset to tensors using some pre-processing steps (resizing, normalization) and visualize it
1. Define and train convolutional neural network for image classification
1. Compute the accuracy of the model on test dataset and (optionally) top-3 accuracy
**Optional steps**:
1. Perform the steps above on the full Oxford Pets dataset and observe the accuracy drop
1. Use transfer learning approach to train the model with higher accuracy, achieving more than 95% top-3 accuracy.
