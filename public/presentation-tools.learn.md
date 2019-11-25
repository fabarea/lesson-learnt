# Presentation Tools Web Slides



What are the presentation tools ?
---------------------------------

I like to write my presentation / slides in Markdown and transform them afterward in web slides / PDF. Although it does not produce the most beautiful presentation with sparkling effects and so on, It allows to just concentrate on the content. For quite some time I was using [cleaver](https://nosir.github.io/cleave.js/) which is a nice and straightforward tool. The downside is that it can not generate PDF which is required in the academic world as "proove of work". That's because I recently move to [Marp](https://marp.app) that looks quite ambitious: Markdown Presentation Ecosystem. I am still experimenting a bit with this tool but it looks quite complete. 

Marp
----

The integration with VS code is **bluffing**! 

```markdown
---
marp: true
---

# Your slide deck

Start writing!
```



As said above, very nice tool. It can me installed globally

```bash
npm install -g @marp-team/marp-cli
```

Or locally via `npx`. From the documentation:

```bash
# Convert slide deck into HTML 
npx @marp-team/marp-cli slide-deck.md
npx @marp-team/marp-cli slide-deck.md -o output.html
 
# Convert slide deck into PDF 
npx @marp-team/marp-cli slide-deck.md --pdf
npx @marp-team/marp-cli slide-deck.md -o output.pdf
 
# Convert slide deck into PowerPoint document (PPTX) 
npx @marp-team/marp-cli slide-deck.md --pptx
npx @marp-team/marp-cli slide-deck.md -o output.pptx
 
# Watch mode 
npx @marp-team/marp-cli -w slide-deck.md
 
# Server mode (Pass directory to serve) 
npx @marp-team/marp-cli -s ./slides
 
# Open converted HTML in preview window 
npx @marp-team/marp-cli -p slide-deck.md
```



- Marp: Markdown Presentation Ecosystem
  https://github.com/marp-team/marp-cli



mkdocs
------

Another option, I am keeping on the radard is [https://www.mkdocs.org](https://www.mkdocs.org/) with the [material design theme](https://squidfunk.github.io/mkdocs-material/). The theme is fully responsive and displays a table of content on the right. This is a python tools which must be installed via pip. On my system (Ubuntu 18.04 as of writing) I had to run



```bash
# I guess with Ubuntu 20.04 it can be python-pip since python 3 will be the default
sudo apt python3-pip 

# Install mkdocs via pip which is more up-to-date.
pip install mkdocs

# Install material design theme
pip install mkdocs-material
```

Bootstrap a new project

```bash
mkdocs new my-mkdocs
mkdocs serve

# Check the command usage
Commands:
  build      Build the MkDocs documentation
  gh-deploy  Deploy your documentation to GitHub Pages
  new        Create a new MkDocs project
  serve      Run the builtin development server
```