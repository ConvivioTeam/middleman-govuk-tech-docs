# Middleman GOVUK Tech Docs

Image built on Ruby 2.5.7 with the latest release of [Tech Docs gem](https://github.com/alphagov/tech-docs-gem).

Built with reference from [Hashicorp Middleman](https://hub.docker.com/r/hashicorp/middleman-hashicorp).

# Usage

```
version: '3'
services:
  dev:
    image: convivio/middleman-govuk-tech-docs
    ports:
      - "4567:4567"
      - "35729:35729"
    volumes:
      - ./:/src
    command: ["bundle", "exec", "middleman", "server", "--bind-address", "0.0.0.0"]
  build:
    image: convivio/middleman-govuk-tech-docs
    volumes: 
      - ./:/src
    command: ["bundle", "exec", "middleman", "build"]
```
