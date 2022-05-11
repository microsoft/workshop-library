[⏮️ Go back to previous step](2-add-content.md)

[⏭️ Go to next step](4-add-web-manifest.md)

# Make your PWA secure - deploy it to an HTTPS endpoint

In this step, we will deploy our PWA to an HTTPS endpoint.

## What are the building blocks of a PWA?

Let's first talk about the three core building blocks for PWA development:

**[HTTPS](https://developer.mozilla.org/en-US/docs/Glossary/https)** - makes your PWA secure. We will describe how to deploy our PWA to an HTTPS endpoint in this step.

**[Web App Manifest](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests)** - makes your PWA installable. We will describe how to add a web app manifest to the PWA in [step 4](./4-make-it-installable.md).

**[Service Workers](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)** - makes your PWA reliable and network-independent. We will describe how to register a service worker for the PWA in [step 5](./5-make-it-network-independent.md).

## HTTPS options

1. Use a hosting service that supports HTTPS by default. Cloud Providers like [Azure](https://aka.ms/learn-pwa/workshop/azure.microsoft.com) offer options like [Azure App Service](https://aka.ms/learn-pwa/workshop/azure.microsoft.com/services/app-service/web) that can help. You will deploy Repose to an [Azure Static Web App](https://aka.ms/learn-pwa/workshop/azure.microsoft.com/services/app-service/static) in this step.
2. Use your own hosting provider and create the required certificates using free services like [Let’s Encrypt](https://letsencrypt.org/docs/).

**Note:** that browsers, such as Microsoft Edge, will let you use http://localhost (non-HTTPS) to preview and test your PWA locally - for debugging purposes only.

## Deploying to an Azure Static Web App

1. Build the distributable package by running this command `npm run build`. This will create a `dist` directory with all necessary files.
1. Install [Azure Static Web Apps VSCode extension](https://aka.ms/learn-pwa/workshop/azure-static-web-apps-vscode-extension)
1. Create a new Azure Static Web App following [steps 1-5 in this tutorial](https://aka.ms/learn-pwa/workshop/azure-create-a-static-web-app).
1. When asked to select the presets that match your application type. Select "Custom" option.
![Custom selection in application type.](./images/3-extension-presets-no-framework.png)
1. For the app location prompt, enter `/`.
1. For build output location, enter `dist`.
1. Follow the rest of the steps in the [previous tutorial](https://aka.ms/learn-pwa/workshop/azure-create-a-static-web-app) to finish creating the Azure Static Web App and see the resource.

**Note:** A `.yml` file will be added to `.github/workflows` folder in your repository root to enable continuos deployment to Azure Static Web Apps after you completed the above steps.

## Summary and next steps

You have now deployed Repose to an Azure Static Web App. Let's 👉🏼 [add all the necessary members to the web app manifest file to make Repose installable](4-add-web-manifest.md).

## Resources
- [30 Days of PWA: 1.4 Make PWA Reliable](https://aka.ms/learn-pwa/workshop/30days-1.4)
- [Microsoft Edge docs: Use HTTPS](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-1---use-https)