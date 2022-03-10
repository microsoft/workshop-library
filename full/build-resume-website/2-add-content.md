# Adding content to an HTML page

[Previously](./1-create-html.md), you saw how to create the structure of an HTML page. Now it's time to add more content to your resume. Specifically, you probably want to add an email address, social media links, your education and professional experience.

## Update the header

Most resumes feature the name of the person at the top as the "title" of the resume. This is a perfect place to use an `h1` tag. You can also add a little separation between the header and the rest of the page by using two horizontal rules, or `hr` tags, with some text in between.

1. Inside **index.html**, change the text "YOUR NAME" to be your name. Change "YOUR TITLE" to your general title - or the title you might like to have - for example, "SOFTWARE ENGINEER".

    > **NOTE** If you want your resume to look like the example we're working towards, follow the casing of the sample text in the HTML template. For example, replace **YOUR TITLE** with "SOFTWARE ENGINEERING STUDENT", using all capital letters. Once you add the CSS styling to your resume, you can experiment with casing to add additional customization.

## Creating email and social media links

Create a link to your email address and any social media you wish to share on your resume. You'll use the `a` tag, which stands for "anchor". `a` has an attribute named `href` (short for hypertext reference). `href` will contain the address you want the link to point to. When a user selects the link, they will be taken to the page. If you want to create a link to an email address, you will use `mailto:` in front of the address; this will open the user's email client.

1. Inside **index.html**, and below the comment which reads `<!-- contact info including social media -->`, add the following HTML to add a link to your email, replacing **your-email@example.com** with your email address:

    ```html
    <p>
        <i class="fa fa-envelope" aria-hidden="true"></i>
        <a href="mailto:your-email@example.com">your-email@example.com</a>
    </p>
    ```

1. The page automatically updates with your email address

    > **NOTE** Notice that there is an `i` tag here - this will eventually contain a little envelope icon. Right now, it just shows up as a square, and that's because you need to add an icon font to your page. Don't worry about that for now - we'll do that in the next section, and that square will magically turn into an envelope.

1. Repeat this for any social media that you want to add. Here are some different icons that you can use for the various social media platforms. Swap out the `class` of the `i` element with any of the following values.

    * fab fa-twitter
    * fab fa-linkedin
    * fab fa-github
    * fab fa-facebook

1. Similarly, swap out the `href` of each `a` element with the appropriate hyperlink for each social media page, and be sure to change the link text as well. For example, if you want to add your GitHub and LinkedIn links to your resume, the HTML would look something like this: 

    ```html
    <p>
        <i class="fab fa-github" aria-hidden="true"></i>
        <a href="github.com/gh-username">gh-username</a>
    </p>
    <p>
        <i class="fab fa-linkedin" aria-hidden="true"></i>
        <a href="linkedin.com/linkedin-username">linkedin-username</a>
    </p>
    ```

> **IMPORTANT** Whenever you add a link to a page you want to ensure the text which is displayed for the link (commonly referred to as link text) accurately describes the target of the link. Text like **here** or **click here** aren't accessible because they don't help the user understand the significance of the link. Using [good link text makes your pages accessible](https://docs.microsoft.com/learn/modules/web-development-101-accessibility/4-links-images?WT.mc_id=academic-51109-ornella) to all.

## Creating lists

Lists come in two varieties in HTML: ordered (with numbers or letters) and unordered (bullet points). `ol` is used to create an ordered list and `ul` is used to create an unordered list. `li` indicates each "list item" in a list. Let's use an unordered list to create a list of our work experience.

You can add as many (or as few) work experience entries as you like, modifying the text as appropriate. 

1. Inside **index.html**, below the comment which reads `<!-- your work experience -->`, add the following HTML to create the list:

    ```html
    <h3>JOB TITLE</h3>
    <p>
			Company Name | 2008 - 2010
    </p>
    <p>
			Describe what you did in this position with one summary sentence and no more than 3 bullet points with specific highlights
    </p>
    <ul>
			<li>Cool accomplishment</li>
			<li>Cool accomplishment</li>
			<li>Cool accomplishment</li>
    </ul>
    ```

1. Swap out JOB TITLE for your previous job title (for example, SOFTWARE ENGINEER).

1. Change the "Company Name" and date as appropriate.

1. Add a short description that sums up your responsibilities.

1. Update the `li` items to add the accomplishments you want to highlight from that work experience.

## Finishing out our resume

Let's fill in the final sections of the resume...

1. Inside **index.html**, below the comment which reads `<!-- your skills -->`, add the following HTML and include any skills that you have. 

	```html
	    <p>HTML, CSS, GitHub, VS Code...</p>
	```

1. Below the comment which reads `<!-- your education -->`, add the following HTML for your education information and update the text to represent your education:

    ```html
    <h3>YOUR MAJOR</h3>
		<p>
			Your university or school
		</p>
		<p>
			2018-2022
		</p>
    ```

1. Below the comment which reads `<!-- about you -->`, add the following HTML and update it with a short blurb on who you are and what kind of company you want to work for:

    ```html
    <p>A brief paragraph about you and what kind of job/company you are looking to work for.</p>
    ```

1. The window updates with your new information

## Summary and next steps

You've now added the information for your resume! You also explored some of the most common HTML tags. But you may notice the display of the page is a little plain. Let's see how we can use [CSS to style the page](./3-add-style.md).
