# Predict Future Water Consumption with ML.NET

## Module Source Link

You can find the full workshop in the [.NET Conf Student Zone 2022 repository](https://github.com/microsoft/dotnetconf-studentzone/tree/main/Using%20IOT%20and%20.NET).
## Goals

In this workshop, we will discuss creating predictions using machine learning.

| **Goal**              | Learn to make predictions from a historical dataset using regression modelling and machine learning with ML.NET                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| **What will you learn**       | Machine Learning, regression model, data visualization                                        |
| **What you'll need**          | [Visual Studio Code](https://code.visualstudio.com/), [.NET SDK 6](https://dotnet.microsoft.com/download/dotnet/6.0?WT.mc_id=academic-78652-leestott), [Polyglot Notebooks extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-interactive-vscode) OR a Github account enabled to [Github Codespaces](https://github.com/features/codespaces?WT.mc_id=academic-78652-leestott) |
| **Duration**                  | 45 minutes                                                                |
| **Microsoft Cloud Topics taught**                  | Azure, GitHub                                                                |
| **Just want to try the app or see the solution?** | [Solution](solution)                          |
| **Slides** | [Powerpoint](slides.pdf) 
                         
## Video

[Train the Trainer Video](https://aka.ms/studentzone-ml)

## Pre-Learning

[Take this ML.NET Learning Path](https://aka.ms/TrainMLdotnet)

*Optional* [Water Consumption Tracking Workshop](../track-water-consumption-iot-dotnet/README.md)

## Prerequisites
*This workshop can be run locally or using GitHub Codespaces.*
### Run the ML notebook locally  
 * [Visual Studio Code](https://code.visualstudio.com/)
 * [.NET SDK 6](https://dotnet.microsoft.com/download/dotnet/6.0?WT.mc_id=academic-78652-leestott)
 * [Polyglot Notebooks extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-interactive-vscode) (Formerly known as .NET Interactive)

### Run the ML notebook on the cloud
 * A Github account enabled to [Github Codespaces](https://github.com/features/codespaces?WT.mc_id=academic-78652-leestott) 
  
## What students will learn

In this session, you will use ML.NET framework and .NET Interactive to estimate water consumption and refill (measured in grams) starting from historical data of accelerometer's aggregated measures.

This session can be used as a "part 2" to the [Water Consumption Tracking Workshop](../track-water-consumption-iot-dotnet/README.md) or can be done by itself.

## Workshop Milestones

1. **Milestone 1: Import the data into your environment**
   
   Let's start by importing the data from a csv file, collecting the aggregation computed from the historical measures of acceleration and weight.
2. **Milestone 2: Explore the data with data visualization**
   
   Data visualization is an efficient tool in data science to understand your data, find out possible relationships between variables and explore distribution of specific columns. It' s an important step before jumping into data modeling.
3. **Milestone 3: Transform the data and prepare it for modelling**
   
   From visualizing the data we learnt which features might be more relevant to estimate our label, so we can now transform the dataset to prepare it to training. Also, we need to hold back a small portion of the dataset for evaluation purposes.
4. **Milestone 4: Create a machine learning experiment**
   
   We are now ready to define our training pipeline for a regressor model, create and run our machine learning experiment, relying on AutoML to discover which model would fit better. At the end of the experiment, we'll be also evaluating the best model's performances using the test dataset.


## Next steps

Use this data to build an API in the [Backend API Water Tracker Workshop](../backend-api-water-tracker/).

## Feedback

Be sure to give [feedback about this workshop](https://forms.office.com/r/MdhJWMZthR)!

[Code of Conduct](../CODE_OF_CONDUCT.md)

