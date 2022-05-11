[⏮️ Go back to previous step](1-create-pwa.md)

[⏭️ Go to next step](3-deploy-to-Azure.md)

# Add content to your PWA

In this step, we will update the source files of the generated solution to add core functionalities such as mood tracking and journaling. 

> Note: The goal of this workshop is not to teach web development. This step is completely optional. You can skip this step if you have other functionalities in mind. Or you can download the completed solution from [this folder - solution/02-repose](./solution/02-repose/) and go to the next step immediately.

Make sure you have the solution running with this command `npm run dev`. So that as you save your changes, you can see them reflected in the browser. You can always stop the server by pressing the `ctrl + c` key combination.

## Structure of the solution

### `index.html`

First, take a look at the entry point of your app, the `index.html` file. This is the file where you describe the structure for your site. The generated project points to `app-index.ts` in the `src` folder, where routes are set up and all components and pages are imported. It also includes metadata such as your app title and description. Let's make a few changes:

1. Update title field with `<title>Repose</title>`.
1. Update description metadata field with `<meta name="description" content="This is a mental health journaling app" />`

### `app-home.ts` in `src/script/pages` folder

This is the home page of Repose. How does the browser know to render it from looking at `index.html`? Because `index.html` points to `app-index.ts` by adding it in the `<body>` tag, and `app-index.ts` determines that the default route `/` uses `app-home.ts` page when the app first updates through the `firstUpdated()` lifecycle event in lit.  

So, let's add a hero section - the first thing people see when they visit Repose homepage.

1. In the `render()` function, after `<app-header></app-header>`, add the following:

```html
  <div class="hero">
    <hero-decor></hero-decor>
    <div class="hero__inner">
      <div class="hero__top-content">
        <h1>Intelligent Daily Mood Journal</h1>
        <p>Repose is your personal mood tracking companion that helps you organize and reflect upon your daily thoughts.</p>
        <fluent-anchor href="/journal" appearance="lightweight">Mood check-in</fluent-anchor>
      </div>
      <div class="hero__bottom-content">
      <img src="assets/media/humans.svg" alt="Humans">
      </div>
    </div>
  </div>
```

2. In the `static get styles()` function, remove all css styles from the `return` statement. Add the following styles:

```css
  .hero {
    height: 90vh;
    min-height: 600px;
    max-height: 900px;
    max-width: 100%;
    max-width: 100vw;
    padding: 0 48px;
    overflow-x: hidden;
    position: relative;
  }

  .hero__inner {
    display: flex;
    flex-direction: column;
    position: relative;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
  }

  .hero__top-content {
    flex: 1 1 0px;
    color: white;
    margin: 4rem 5rem 0;
    text-align: center;
    max-height: 25vh;
  }

  .hero__top-content h1 {
    font-weight: normal;
    font-size: 48px;
  }

  .hero__top-content fluent-anchor {
    margin-top: 1rem;
  }

  .hero__top-content fluent-anchor::part(control) {
    border-radius: 15px;
    color: #107652;
  }

  .hero__top-content fluent-anchor::part(control):hover {
    color: #2E765E;
  }

  .hero__bottom-content {
    flex: 1 1 0px;
    height: 50vh;
  }

  .hero__bottom-content img {
    width: 100%;
    height: 100%;
  }

  @media screen and (max-width: 840px) and (min-width: 625px) {
    .hero__top-content {
      margin: 4rem 2rem 0px;
    }
  }

  @media screen and (max-width: 625px) and (min-width: 480px) {
    .hero__top-content {
      margin: 2rem 2rem 0px;
    }

    .hero__bottom-content {
      margin-top: 7rem;
    }
  }

  @media screen and (max-width: 480px) {
    header {
      margin: 0 2rem;
    }

    .hero {
      padding: 0 1rem;
    }

    .hero__top-content {
      margin: 1rem 0;
    }

    .hero__top-content h1 {
      font-size: 36px;
    }

    .hero__bottom-content {
      margin-top: 7rem;
    }
  }
```

## Create a new reusable component

Whenever you need to add a new reusable component to your app, you should add it to `src/script/components` folder. Common reusable components are: header, navigation, and footer. In Repose, we will add a new reusable component called `hero-decor`. This is the hero image that will be displayed as background on both the home page and the journal page.

1. Create a hero decorative component called `hero-decor.ts` in `./src/script/components/` folder that renders as the hero section background. Import this component in `app-index.ts` file with `import './script/components/hero-decor';` on line 8 after the import of header component. And copy the code from [this hero-decor file](./solution/02-repose/src/script/components/hero-decor.ts) to it. You can use your own image or design and add custom css to brand it your way.

## Copy assets, styles, and other files

Again, we are copying these files instead of going into details of the code because we want to keep the workshop focused on the core functionalities of PWA. At any time of this step, feel free to download the completed solution from [this folder - solution/02-repose](./solution/02-repose/) and go to the next step immediately

### Add creatives folder

1. Add the [media folder](./solution/02-repose/public/assets/media/) that contains two creatives to `./public/assets` folder. These are background images for Repose.

### Update global styles

1. Replace the `global.css` file in `./src/styles/` folder with the styles in [this file](./solution/02-repose/src/styles/global.css).
2. Remove unwanted styles from generated files, such as in `./src/script/app-index.ts`, remove `padding-left: 16px;` and `padding-right: 16px;` from `main` element.

### Update header component

Just like the hero decorative component, you will update the header component to fit the need of Repose. And it will be reused across all pages.

1. Replace `header.ts` with the code in [this file](./solution/02-repose/src/script/components/header.ts).
2. Update `app-home.ts` to include "Go Back" function as part of the `app-header` component. Simply add attribute `enableBack="${true}"` to it. Now `app-header` element should look like this: `<app-header enableBack="${true}"></app-header>`.

## Add or update app pages

You can create new pages for the app and put them in `src/script/pages` folder. These pages can use the reusable components you created in the previous step. In Repose, you will not need an about page. So you can update `app-about.ts` file name to `app-journal.ts` and add journaling functionalities to it.

1. Change the name of file `app-about.ts` to `app-journal.ts`. You will also need to update this in `app.index.ts` file in router setup (`children` property of `router.setRoutes`) as following:

```typescript
  {
    path: '/journal',
    component: 'app-journal',
    action: async () => {
      await import('./script/pages/app-journal.js');
    },
  },
```

Now when you click "Mood check-in" button, Repose app will navigate to journal page with no content.

2. Add jounaling functionality to the `app-journal.ts` page with code from [this file](./solution/02-repose/src/script/pages/app-journal.ts).

3. Add this [interface file](./solution/02-repose/src/script/interfaces/journalEntry.ts) to the project.

4. Add this [utility file](./solution/02-repose/src/script/utils/journal.ts) to the project.

5. Add `localforage` to the project devDependencies with this command: `npm i localforage -D`.

6. Now restart your dev server with `npm run dev` and you should see the journal page!

## *Bonus functionalities

If you would like to add functionality to show existing journals, you can take a look at the completed [`app-home.ts` file](./solution/02-repose/src/script/pages/app-home.ts) for reference. You can also add a [footer component](./solution/02-repose/src/script/components/footer.ts) to your app.

## Summary and next steps

Let's do a quick recap of what you did in this step:
- You updated `index.html` file to include title and metadata for Repose app.
- You did a complete redesign of the homepage including some custom CSS styles and creatives as background images.
- You created a reusable component called `hero-decor` that renders as the hero section background. This is used in both `app-index.ts` and `app-journal.ts` pages. You can also use it in other pages as you create them.
- You updated the existing header component.
- You created a new page called `app-journal.ts` that includes journaling functionality.

Something to consider for the next steps if you are building a production ready app: Instead of using `localforage`, which stores journal entries in indexDB of your local browser's storage, you should consider using a more persistent storage solution.

Next, let's make the Repose app 👉🏼 [secure (step 3)](3-deploy-to-Azure.md), [installable (step 4)](4-add-web-manifest.md), [network-independent (step 5), and work offline (step 5)](5-register-service-worker.md)!

## Resources
- [Microsoft Learn Module: Build a simple website using HTML, CSS, and JavaScript](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/learn/modules/build-simple-website/)
- [Workshop: Build a Website to Showcase your Resume](https://aka.ms/learn-pwa/workshop/github.com/microsoft/workshop-library/tree/main/full/build-resume-website)
