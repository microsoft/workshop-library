# Python HTTP API for use with GitHub Codespaces

_Run a Python API in this ready-to-use-repository in minutes_

By opening this template respository in Codespaces, you can quickly get hands-on with a Python web app that serves an HTTP API using the [FastAPI](https://fastapi.tiangolo.com/) framework. You'll get to focus on working with the project instead of setup and configuration.

🤔 Curious? Watch the following video where we explain all the details:

[![Python development environment with Codespaces](./images/banner.gif)](https://youtu.be/_i9Pywj3rSg "Python Development environment with Codespaces")

## About Codespaces

Using Codespaces, you get [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza) in the cloud, using a ["development container"](https://containers.dev/). Like a locally running version of [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza), the cloud version also allows you to install extensions and use a terminal.

You can also configure your development container to run a specific runtime and have it boot up with your favorite extensions.

## What you will learn and requirements for this workshop

| **Goal**              | Description                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| **What will you learn**       | you will customize your environment in codespaces and manage APIs               |
| **What you'll need**          | A [GitHub account](https://github.com), access to [Codespaces](https://github.com/features/codespaces) and [FastAPI framework](https://fastapi.tiangolo.com/) |
| **Duration**                  | 35 minutes                                                                |
| **Slides**                  | [slides](./slides.pptx) |


## Link for this template and it's resources

This template [Python HTTP API for use with GitHub Codespaces](https://github.com/microsoft/codespaces-project-template-py) includes all the resources you **will need in order to demonstrate the full presentation to your audience**.

This template is also ready to be used with [Codespaces](https://github.com/features/codespaces), a developer environment running in the cloud with [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza).

## 🚀 Next steps

Take this API application to the next level and deploy it to the cloud! For this learning challenge you'll use a FREE deployment option for Azure and GitHub Actions for the automation.

Before continuing, make sure you have an Azure account ready. Select any of the following:

- [Sign in to your Azure account](https://azure.microsoft.com/en-US/?WT.mc_id=academic-77460-alfredodeza)
- [Create a (no Credit Card required) Azure For Students account](https://azure.microsoft.com/free/students/?WT.mc_id=academic-77460-alfredodeza)
- [Create a new Azure account](https://azure.microsoft.com/en-US/?WT.mc_id=academic-77460-alfredodeza)

There are a few steps involved, so make sure you get everything right!

<details>
<summary><b>Create an Azure App Service</b></summary>

Now, you are going to set up automatic deployment of the application using Azure plus GitHub actions! However, you first need to configure some Azure services.

1. Open the [Azure Cloud Shell](https://shell.azure.com/?WT.mc_id=academic-77460-alfredodeza).
1. Use the Bash shell (not PowerShell!) for these steps.
1. If it says "You have no storage mounted", select a subscription in your account and click "Create storage". The Cloud Shell uses that storage resource to store data generated during your shell sessions.
1. Create a *Resource Group* which will group together the different Azure resources used for the app:
```
az group create --name demo-fastapi --location "East US"
```
1. You'll see a JSON response with details about the newly created resource, for this command and all the commands that follow.
1. Create the **FREE** *App Service Plan*:
```
az appservice plan create --name "demo-fastapi" --resource-group demo-fastapi --is-linux --sku FREE
```
1. Create a random identifier for a unique webapp name:
```
let "randomIdentifier=$RANDOM*$RANDOM"
```
1. Create the *Web App Service* with a placeholder container using the `randomIdentifier` variable from before:
```
az webapp create --name "demo-fastapi-$randomIdentifier" --resource-group demo-fastapi --plan demo-fastapi --runtime "PYTHON:3.9"
```
1. Head to the Azure portal [App Services list](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Web%2Fsites) and confirm that your newly created service is listed.

</details>


<details>
<summary><b>Create an Azure Service Principal</b></summary>

Next, create an Azure Service Principal, which is a special type of account that has permissions necessary to authenticate from GitHub to Azure:

1. Find the ID of your Azure Subscription [in the Azure portal](https://portal.azure.com/#view/Microsoft_Azure_Billing/SubscriptionsBlade?WT.mc_id=academic-77460-alfredodeza) or [by following this guide](https://learn.microsoft.com/azure/azure-portal/get-subscription-tenant-id?WT.mc_id=academic-77460-alfredodeza).
1. Create a Service Principal with a "contributor" role that is allowed to make changes to any resources in that subscription. Replace $AZURE_SUBSCRIPTION_ID with the ID you found in step 1 and run this command:

```
az ad sp create-for-rbac  --sdk-auth --name "github-deployer" --role contributor --scopes /subscriptions/$AZURE_SUBSCRIPTION_ID
```

1. Capture the output and add it as a [Github repository secret](/../../settings/secrets/actions/new) with the name `AZURE_CREDENTIALS`. (_If that link doesn't work, make sure you're reading this on your own copy of the repo, not the original template._)

</details>

<details>

<summary><b>Setup GitHub Actions</b></summary>

Now that you have all the Azure resources created, you need to update the GitHub Action workflow file with the name of your webapp.

1. Find your app name. It should look something like `demo-fastapi-97709018` but with a different random number at the end,
and you can find it in the Azure portal or the Cloud Shell commands.
2. Open the [.github/workflows/web_app.yml](/../../edit/main/.github/workflows/web_app.yml) file and update the value of `AZURE_WEBAPP_NAME` to your app name.
3. Commit and push the changes to the Github repository:

```
git add .github/workflows/web_app.yml
git commit -m "Updating workflow file"
git push
```

</details>

<details>
<summary><b>🏃 Deploy your app!</b></summary>

Before continuing, check the following:

1. You've created an Azure Service Principal and saved it as a [repository secret](/../../settings/secrets/) as `AZURE_CREDENTIALS`.
1. You've created an [App Service](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Web%2Fsites) with a valid name and the site is already available with the default static content.

To deploy:

1. Navigate to [repository actions](/../../actions/workflows/web_app.yml). (_If that link doesn't open the "Build and deploy Python app" workflow, make sure you're reading this on your own copy of the repo._)
3. Select _Run workflow_ and select the green button inside the pop-up to run the workflow.

**Deploying can take a couple of minutes**. Make sure you stream the logs in the Azure Cloud Shell to check the progress:

```
az webapp log tail --name $AZURE_WEBAPP_NAME --resource-group $AZURE_RESOURCE_GROUP
```

4. Once deployment is complete, visit your website at a URL like `http://demo-fastapi-97709018.azurewebsites.net/`,
where the random number is your unique random number. You can find the website URL in the Azure portal or in the deployment logs if you forgot the number.
5. 🎉 Celebrate a successful deployment! You now have a URL that you can share with classmates, friends, and family.

### Destroy resources when complete

You likely don't want to keep this particular website running forever in the cloud, so you should cleanup your Azure resources by destroying the resource group. You can do it in the Azure Cloud Shell by referencing the group name you created initially (`demo-fastapi` in the examples):

```
az group delete --name demo-fastapi
```

### Deployment Troubleshooting

When deploying, you might encounter errors or problems, either on the automation part of it (GitHub Actions) or on the deployment destination (Azure Web Apps).

You can check the logs of the Github Actions workflow by selecting the latest workflow from the _Actions_ tab. Find the first step that has a broken icon next to it, and expand that step to see what went wrong in it.

If running into trouble with the Azure deployment, check logs in the portal or use the following with the Azure CLI:

```
az webapp log tail --name $AZURE_WEBAPP_NAME --resource-group $AZURE_RESOURCE_GROUP
```

Update both variables to match your environment.


</details>


## Other Resources

- [FastAPI](https://fastapi.tiangolo.com/)
- [Codespaces](https://github.com/features/codespaces)
- [Use Dev containers locally](https://github.com/Microsoft/vscode-remote-try-python)

## Feedback

Be sure to give [feedback about this workshop](https://forms.office.com/r/MdhJWMZthR)!

[Code of Conduct](../../CODE_OF_CONDUCT.md)
