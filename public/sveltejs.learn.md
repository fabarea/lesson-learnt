---
date: 2019-03-21T10:39:15.000Z
title: SvelteJS
---

## How to handle Graphql request in a Sapper application?

We can find some good answer there. The article also covers how you can create subscription.
I haven't tried the subscript part yet. The rest of the article is fine. I am not handling the server side code generation howerver.

https://frustrated.blog/2019/07/18/sapper-graphql-subscriptions.html

## How do I handle the login with a Sapper application?

Check the `realworld` example.

## How to deploy sapper application on Netlify?

```
  edit netlify.toml __sapper__/export
```

## How to import Svelte widget into existing project

Just import the `bundle.js` file it seems.

```
  <script defer src="/bundle.js"></script>
```

## How do I start a sveltjs project?

```
  npx degit sveltejs/template my-first-svelte-project
```

## What is sirv?

An optimized middleware & CLI application for serving static files
The core module, returning a middleware function for use in Polka & Express-like frameworks.

We can see a file change here.
https://github.com/sveltejs/template/commit/58a97ff774e9fc4ef0a561ae0a48e8dee122e965
