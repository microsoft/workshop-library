#  Using .NET MAUI to Build a Mobile App

Hello! This is a simple repo for demonstrating how to a build mobile app using .NET Maui to keep track of water consumption.

.NET Multi-platform App UI (.NET MAUI) is a cross-platform framework for creating native mobile and desktop apps with C# and XAML. Using .NET MAUI, you can develop apps that can run on Android, iOS, macOS, and Windows from a single shared code-base.

# Prerequisites
- Install [Visual Studio](https://visualstudio.microsoft.com/vs/?WT.mc_id=academic-78652-leestott)
- Install [.NET SDK 6.0](https://dotnet.microsoft.com/en-us/download/dotnet/6.0?WT.mc_id=academic-78652-leestott)
- Build a [Minimal API](https://github.com/microsoft/dotnetconf-studentzone/tree/4bf0808b9de0e8a8e384e4cbf814034b718e6d52/Add%20a%20backend%20to%20your%20website)

# Resources
- [Build your first app with .NET MAUI](https://learn.microsoft.com/en-us/dotnet/maui/get-started/first-app?WT.mc_id=academic-78652-leestott%3Ftabs%3Dvswin&pivots=devices-android&tabs=vswin)
- [Build a web API with minimal API, ASP.NET Core, and .NET 6](https://learn.microsoft.com/en-us/training/modules/build-web-api-minimal-api/?WT.mc_id=academic-78652-leestott)
- [Consume REST web services in .NET MAUI apps](https://learn.microsoft.com/en-us/training/modules/consume-rest-services-maui/?WT.mc_id=academic-78652-leestott)

# Update the APIManager.cs Class

We need to update the API details on line 15 to 17 on the APIManager.cs class. You will need to add your API Url for BaseAddress and API Key for AuthorizationKey. You get the API details from the Minimal API that you have already built.
```
static readonly string BaseAddress = "{YOUR_API_BASE_URL}";
static readonly string Url = $"{BaseAddress}/consumption/";
private static string authorizationKey = "{YOUR_API_KEY_VALUE}";
```
As part of the headers for your API make sure that the key you use in your code matched the key from your API headers. In this solution we use dotnetconfstudentzone for demo purposes. This is line 24 in our APIManager.cs
```
client.DefaultRequestHeaders.Add("Accept", "application/json");
client.DefaultRequestHeaders.Add("dotnetconfstudentzone", authorizationKey);

```

# NuGet Package Dependencies
You will need to add [NewtonsoftJson](https://www.newtonsoft.com/json) using NuGet Package Manager
