#  Build your Resume with Blazor, Solution Code

Hello! This is a simple repo for demonstrating how to build a Blazor-WASM site to display a resume.

Blazor WASM (or Blazor WebAssembly) is a single-page web application framework built by Microsoft that allows you to build single-page web applications. Built as part of the .NET Core ecosystem, Blazor uses C# to generate dynamic content for a rich client experience.

# Some Additional Resources for Blazor :fire:
- [Blazor Tutorial Build your first Blazor app](https://dotnet.microsoft.com/en-us/learn/aspnet/blazor-tutorial/intro?WT.mc_id=academic-78652-leestott)
- [What is Blazor WASM](https://preview.blazorise.com/blog/what-is-blazor-wasm)

# :open_file_folder: This solution contains the following:

- [Components](#components) - several components used to display pieces of the resume.
    - The most important component is `resume.razor`. This component is responsible for grabbing the resume's data and displaying it.
- Navigation - changes made to `Shared/NavMenu.razor` to update the left hand navigation.
- [Data](#data) - a JSON file stored in `wwwroot/sample-data` that holds resume specific data.
- C# representation of the resume. Code in `Pages/Common/Types.cs` that model the data from the resume.json in C#. (The resume's data is loaded in `resume.razor`.)
- [Styling](#styling) - CSS changes used to make the resume 

# Installs required
 * [Visual Studio](https://visualstudio.microsoft.com/?WT.mc_id=academic-78652-leestott)
 * [.NET SDK 6](https://dotnet.microsoft.com/download/dotnet/6.0?WT.mc_id=academic-78652-leestott)

## Run

To run the app, open up a terminal window and make sure you're in teh same directory as the `blazor-resume.csproj` file. (It's the same directory as this README file). Then run:

```console
dotnet run
```

The terminal will display a variety of output, including the URL the site can be viewed at.

## Components

- `Resume`, a "smart" component you can navigate to via `/resume`. This component contains the rest of the presentation components that display the resume.
- `Skill`, presentation component rendering a skill.
- `Experience`, presentation component rendering an experience.
- `Education`, presentation component rendering an education.

## Data

The idea is for this app to use an API. Currently, it relies on static data, a JSON file placed in `sample-data/resume.json`.

The data is a JSON file and looks like the following hierarchy:

```json
{
 "about": "string",
 "experiences" : [],
 "educations": [],
 "skills" : []
}
```

## Styling

Components rely mostly on their own styling, "<Component>.razor.css" with a few exceptions in `wwwroot/css/app.css`.

## Screenshot

![a screenshot of the resume website running](resume-demo.png)
