# The Sharp Dev Website
Blog posts for [The Sharp Dev](http://thesharpdev.com)

Content is statically generated thanks to [Hugo](https://gohugo.io/)!

### Install Hugo
```bash
brew install hugo
```

### Install the Theme
The theme used is linked by a submodule which must be pulled in first.

```bash
git submodule update --recursive
``` 

### Running locally

Starts a local Hugo server with drafts enabled

```bash
make serve
```

### Create a new post

Adds a new post to the posts directory
```bash
make post title="foobar"
```

### Github Actions

#### Pull Request
Each pull request will kick off a short suite of end to end tests with Cypress

### Merge to Main
This will build the Hugo static files and publish them for Github Pages