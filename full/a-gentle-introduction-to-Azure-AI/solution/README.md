# ChatGPT + Enterprise data with Azure OpenAI and Cognitive Search
The solution folder includes the [recording of the demo](./demo_recording.mp4), showing the main capabilities of an application which combines Azure OpenAI service and Azure Cognitive Search to provide a ChatGPT like experience on private data. You can either choose to play the video recording during your presentation and describe what is happening or you can replicate the demo on your own. 

![App Demo](../images/appdemo.gif)


## The solution architecture
The application shown in the demo is built upon the architecture below.

![Architecture](../images/architecture.png)

It leverages the Cognitive Search service to index the input documents and to make them accessible through specific queries. The web application is built of a graphical interface – enabling the user to chat with the data in natural language, by asking questions. The app backend acts as an orchestrator, converting the user input into a query for the Azure Cognitive Search and uses the output of the search on its turn as a meta-context injected into the Azure OpenAI service prompt. Finally, Azure OpenAI service generates an answer in natural language for the final user, specifying the sources on which the answer is based. 
Moreover, the solution leverages also another Azure Cognitive service called Form Recognizer, used to “cracks” documents to read handwriting, text, tables, and process language to extract entities.


## The Application
This application offers a graphical user interface to allow users to chat with their own private data. This data are hosted in an Azure Storage Account and indexed by an Azure Cognitive Search instance. It contains information around Contoso employees' benefits and their handbook. Contoso is a fictional company that wishes to provide its employees with a ChatGPT-like experience to get clarifications on their healthcare plan and more.


## Demo
The [demo recording](./demo_recording.mp4) provided in this folder explores a few app's features:
* Chat and Q&A interfaces
* Various options to help users evaluate the trustworthiness of responses with citations, tracking of source content, etc.
* *Thought process* button, displaying the search query and the prompt used in input for Azure OpenAI service.
* Chat history tracked and re-submitted to Azure OpenAI service at each turn of conversation.

It showcases 3 different types of scenarios and corresponding behaviors:
* Asking a suggested question;
* Asking a follow-up question to the previous one;
* Asking a question that cannot be answered with the data provided as input. 


## Do you wish to replicate the demo?
To replicate the demo you can refer to the step-by-step tutorial provided in the [original GitHub Repo](https://github.com/Azure-Samples/azure-search-openai-demo?WT.mc_id=academic-97358-cacaste), hosting the application code, the Contoso data and the script to deploy the required resources.

To get started you'll need an **Azure subscription with access enabled for the Azure OpenAI service**. You can request access [here](https://aka.ms/oaiapply). You can also visit [here](https://azure.microsoft.com/free/cognitive-search/) to get some free Azure credits. If you are a student, claim your Azure for Student trial [here](https://azure.microsoft.com/free/students/?WT.mc_id=academic-97358-cacaste).

Note that if you can't get access to Azure OpenAI service, because your application doesn't match the [acceptance criteria](https://learn.microsoft.com/legal/cognitive-services/openai/limited-access?context=%2Fazure%2Fcognitive-services%2Fopenai%2Fcontext%2Fcontext&?WT.mc_id=academic-97358-cacaste), you can rely on the [OpenAI public APIs](https://platform.openai.com/docs/api-reference/introduction) to build your prototype. Instructions on how to enable a non-Azure OpenAI endpoint in your solution are included in the [original GitHub Repo](https://github.com/Azure-Samples/azure-search-openai-demo?WT.mc_id=academic-97358-cacaste).


