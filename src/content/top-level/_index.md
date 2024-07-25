+++
[_build]
list = 'never'
render = 'never'
+++

The `top-level/` content directory represents a "hidden" section that contains all of the single, one-off pages that live at the site's top level. Each sub-page within this section should explicitly set a `url` value in the front matter that does _not_ contain the path component `top-level`.

As an example, the page served from the URL `/contact/` would be backed by the file `src/content/top-level/contact.md` with the following (bare bones) front matter:

```toml
url = 'contact'
title = 'Contact Me'
```

This also works identically for page bundles, e.g. `src/content/top-level/contact/index.md`.
