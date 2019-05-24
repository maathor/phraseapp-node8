# phraseapp-node8


see https://cloud.docker.com/repository/docker/maathor/phraseapp-node8/general

## Why ?

I use this image to build front (react/js/...) into statics pages page with gitlab runner. (or whatever)

### Sample of my .gitlab-ci

```
image: maathor/phraseapp-node8
variables:
  PHRASEAPP_ID: XXXXXXXXXXXXXXXXXXXXX
  PHRASEAPP_SECRET: XXXXXXXXXXXXXXXXXXXXXX
  GOOGLE_API_KEY: XXXXXXXXXXXXXXXXXXXX

stages:
  - build

build:
  stage: build
  script:
    - npm config set color false
    - yarn install
    - NODE_ENV=production npm run deploy:prod
    - cd dist
#    - (do your aws cp here to s3)
  tags:
    - tools

```

## What did it contains ?

Based from `node:8.16.0-alpine`, it contains :
  - Node 8
  - python3
  - pip for python3
  - aws cli, I like to send my static page on s3 (see https://docs.aws.amazon.com/fr_fr/AmazonS3/latest/dev/WebsiteHosting.html)
  
All issues are welcome !
