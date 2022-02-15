![PullPreview](https://github.com/pullpreview/demo-ruby-on-rails/workflows/PullPreview/badge.svg)

## Demo of PullPreview action for a Ruby on Rails application

Have a look at the `.github/workflows/pullpreview.yml` file, as well as the `docker-compose.*` files to see how it's setup.

Deployments are visible on https://github.com/pullpreview/demo-ruby-on-rails/deployments.

In this demo, PullPreview is configured with Caddy as a proxy, which automatically provides SSL certificates, as well as protecting the access to the preview environment with a Basic Auth:

- username=`admin`
- password=`p4ssw0rd`

## How to run locally for development

    PULLPREVIEW_PUBLIC_DNS=perso.click docker-compose -f docker-compose.yml -f docker-compose.pullpreview.yml up
