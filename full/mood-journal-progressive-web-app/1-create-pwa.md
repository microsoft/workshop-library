[⏮️ Go back to previous step](0-setup.md)

[⏭️ Go to next step](2-add-content.md)

# Create a new Progressive Web App

In this step, we will first talk about what is a PWA, and then we will create a new PWA using PWA studio.

## What is PWA?

A [Progressive Web App (PWA)](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/) is a traditional web app that is progressively enhanced using open web technologies, to make sure it delivers the best possible experience on every device, based on available capabilities.

Progressive Web Apps use [service workers](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers), [manifests](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests), and other web platform features in combination with [progressive enhancement](https://developer.mozilla.org/en-US/docs/Glossary/Progressive_Enhancement) to give users an experience on par with platform-specific (Windows, Andriod, etc.) apps.

## Create a PWA using PWA Studio

There are many ways to create a new web app. However, if you are designing your web app with progressive enhancement and platform-specific features in mind, you should consider using a template with ready-to-go configurations that can help you quickly get started. Enter [PWA Studio](https://aka.ms/learn-pwa/workshop/pwa-studio) VSCode Extension!

Let's install the extension and follow these [steps](https://aka.ms/learn-pwa/workshop/github.com/pwa-builder/pwa-studio/wiki/Create-a-New-PWA) to create a new PWA.
1. Tap on the PWA Studio icon on the left side of the VSCode Window
1. Click the Start new PWA button on the bottom bar of VSCode.
1. Enter the repository name "repose" and hit enter.
1. Your PWA will open in its own Window, with all the dependencies installed and ready to start coding.

![Start a new PWA in VSCode command bar using PWA Studio extension.](./images/1-command-bar-startnew.png)

## Exploring the generated solution

Before you start coding, let's explore the generated solution. The PWA Studio extension was created based on the PWABuilder [pwa-starter](https://aka.ms/learn-pwa/workshop/github.com/pwa-builder/pwa-starter) project. It uses the following tech stack:

- [**lit**](https://lit.dev/): PWABuilder team's framework of choice. This means you will also be using lit as a web component framework to build your PWA.
- [**@fluent/web-components**](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/fluent-ui/web-components/): The Fluent Web Components are a set of UI components, like [Ionic](https://ionicframework.com/), or the [Material Design Web Components](https://material.io/develop/web). This provides a set of modern UI components that are ready to use and can be easily customized.
- [**Vite**](https://vitejs.dev/): Vite handles bundling the code, generating the Service Worker and more! We will dig a little deeper into this later when we talk about the Service Worker and cache strategy.
- [**Vaadin Router**](https://vaadin.github.io/router/vaadin-router/demo/#vaadin-router-getting-started-demos): For routing, this project uses the Vaadin router.
- [**TypeScript**](https://aka.ms/learn-pwa/workshop/www.typescriptlang.org/): TypeScript gives you features such as auto complete in your code editor that helps make the development process easier and faster.

Next, let's look at the file structure of the generated solution.

| files/folders | description |
| ------------- | ----------- |
| `public` | This folder contains all the files that are served to the browser such as your app icons, screenshots, and other creative assets. |
| `index.html` | This is the main HTML file that is served to the browser and the entry point of your source code. |
| `public/manifest.json` | This is the manifest file that is used to configure your PWA. |
| `src` | This folder contains all the source code for your app. |
| `src/app-index.ts` | This file is the main entry point for your app code. The router is configured here, as well as service worker registration. |
| `src/components` | This folder contains reusable components of your app. |
| `src/pages` | This folder contains different pages of your app. Each page owns their css styles in the default setup. |
| `src/styles` | This folder contains css stylesheets. |
| [`package.json`](https://nodejs.org/en/knowledge/getting-started/npm/what-is-the-file-package-json/) | This is the file that holds metadata relevant to your project and it is used for managing dependencies, scripts, versions, and more. |
| `tsconfig.json` | This is the configuration file for TypeScript. |
| `vite.config.ts` | This is the `vite` config file that knows how to build and bundle the code. It contains `workbox` config which controls how caching is handled.  |

## Run the generated PWA

To run the solution, simply type the following command in the terminal of VSCode or your terminal of choice:

```bash
npm run dev
```

## Push the solution to GitHub

Remember that Git repository you created in the last step? Let's now push our solution to it using the following command from your project directory:

```bash
git remote add origin https://github.com/<your_git_username>/<your_repo_name | repose.git>
git branch -M main
git push -u origin main
```

You can double check your project push/pull remote configuration by using the following command:

```bash
git remote -v
```

## Summary and next steps

You have now created your Progressive Web App! Next, 👉🏼 [add additional content](2-add-content.md) such as mood journaling to make it a functional web app.

## Resources
- [30 Days of PWA: 1.1 Introducing PWA](https://aka.ms/learn-pwa/workshop/30days-1.1)
- [30 Days of PWA: 1.2 Deconstructing PWA](https://aka.ms/learn-pwa/workshop/30days-1.2)
- [Microsoft Edge docs: Overview of Progressive Web Apps (PWAs)](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/)
- [30 Days of PWA: 3.1 Get-started tools - Part 1](https://aka.ms/learn-pwa/workshop/30days-3.1)
- [30 Days of PWA: 3.2 Get-started tools - Part 2](https://aka.ms/learn-pwa/workshop/30days-3.2)
