# API for a resume

This project is an API built using (Minimal API for .NET 6

## Resources

* [.NET SDK 6.0.402+](https://dotnet.microsoft.com/download/dotnet/6.0?WT.mc_id=academic-78652-leestott)
* [Tutorial Build a web API with minimal API, ASP.NET Core, and .NET 6](https://learn.microsoft.com/training/modules/build-web-api-minimal-api/?WT.mc_id=academic-78652-leestott)
* [Documentation: Create a minimal web API with ASP.NET Core](https://learn.microsoft.com/aspnet/core/tutorials/min-web-api?view=aspnetcore-6.0&tabs=visual-studio?WT.mc_id=academic-78652-leestott)

## Getting Started

To run the Water consumption API, do the following:

- Install EF Core tools

   ```console
   dotnet tool install --global dotnet-ef
   ```

- Apply migrations to database (will create the DB, it's tables and give it initial data)

   ```console
   dotnet ef database update
   ```

- Start the API

   ```console
   dotnet run
   ```

## API

This API has the following endpoints:

- `/`, default route responding with "hello world"
- `/Consumptionsecure`, a route representing a resume, responding with a JSON:

   ```json
   [
   {
     "Id": 1,
     "DateTime" : "",
     "Consumption": 100
   },
   {
     "Id": 2,
     "DateTime" : "",
     "Consumption": 110
   }
   ]
   ```

- `/swagger`, an Open API endpoint that represents the docs of the API

## Deployment

To deploy this API, there are the following things you need to do:

* Provision of the database.
* Generate SQL scripts from Entity Framework and run those on your provisioned database in Azure.
* Deploy the API to Azure App Service.


## -1- Provision an Azure SQL Server database

1. Navigate to Azure portal, <https://portal.azure.com>
1. Provision an Azure SQL Server
1. Under said server, provision a database

Make note of the connection string, you will use it later and to your app deployment.

Next, you want the table structure and data from your C# code but in a SQL format. Here's how:

1. Run this command in the console:

   ```console
   dotnet ef migrations script
   ```

   save the output, you will need to run it in your Azure portal.

1. Navigate to the portal:

   > portal.azure.com

1. Locate your database resource
1. Select they query editor and login in to your database.
1. Paste the SQL code that you generated earlier, this will create your tables and insert your data.

Last step is open up the Database server

1. Go to Networking and check the option "Allow Azure services and resource to access this server"

  This will allow your web app on Azure to access the database as it creates a rule in the firewall.

## -2- Deploy API

There are two different ways to deploy we will mention, select one of them:

* Azure CLI
* Using Visual Studio Code Azure extension

### Add app settings config

1. Open appsettings.json and add section like so:

   ```json
   {
     "ConnectionStrings": {
       "DB" : "<replace with Azure DB connection string value>"
     }
   }
   ```

   add the connection string value you copied from Azure database.

1. Add a `secret` property and a value of your choice to the JSON like so:

   ```json
   {
     "ConnectionStrings": {
       "DB" : "<replace with Azure DB connection string value>"
     },
     "secret": "<replace with the secret value you want, make it long and complicated>" 
   }
   ```

### Alt 1 - Using Azure CLI

> <https://learn.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-rest-api>

To deploy the API, here's what you need to do:

1. Login with `az`:

   ```console
   az login
   ```

1. Create a resource group (if you don't already have one)

   ```console
   az group create --name myResourceGroup --location "West Europe"
   ```

1. Create an app service plan:

   ```console
   az appservice plan create --name myAppServicePlan --resource-group myResourceGroup --sku FREE
   ```

1. Create the web app (acts like a placeholder for your app)

   ```console
   az webapp create --resource-group myResourceGroup --plan myAppServicePlan --name "replace with your app name" --deployment-local-git
   ```

   make a note of the variable value for `deploymentLocalGitUrl`, you will use it later.

1. Deploy the code to the app

   ```console
   az webapp config appsettings set --name "replace with your app name" --resource-group myResourceGroup --settings DEPLOYMENT_BRANCH='main'
   ```

1. Add an Azure remote

   ```console
   git remote add azure <deploymentLocalGitUrl-from-create-step>
   ```

1. Push to the Azure remote you just configured

   ```console
   git push azure main
   ```

That's it, that deploys your source code to your web app on Azure.

### Alt 2 - Using Visual Studio Code

Make sure you have the relevant Azure extension:

* Install Azure Tools, <https://code.visualstudio.com/docs/azure/extensions> that will include App Service that you will need for deployment

1. In Visual Studio Code, select the Azure icon in the left menu bar.
1. In resources, select the subscription you want to use.
1. Right click "App Services" node and select "Create New Web app" and follow the instructions
1. Once the web app is created, right click it and select "Deploy to Web App", this will deploy your source code

### Open up API for external requests

1. In the portal, go to your web app resource, and select the CORS menu.
1. Add "*" to allowed origins, this will allow any IP to make calls towards the API (that's a great option for open APIs but for company APIs you might want to be more restrictive like companydomain.com for example)