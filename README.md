# gitlab-ci-laravel-deploy

Modify from: https://gitlab.com/mehranrasulian/laravel-sample/blob/master/Dockerfile

# Docker hub
https://hub.docker.com/r/danny50610/gitlab-ci-laravel-deploy/

# Docker Build
```
docker build --no-cache -t danny50610/gitlab-ci-laravel-deploy:<version> .
```

# .gitlab-ci.yml Example
```
deploy_production:
  tags:
    - deploy
  stage: deploy
  image: danny50610/gitlab-ci-laravel-deploy
  dependencies: []
  script:
    - eval $(ssh-agent -s)
    - ssh-add < (echo "$SSH_PRIVATE_KEY")
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
    - ~/.composer/vendor/bin/envoy --version

    - ~/.composer/vendor/bin/envoy run deploy
  environment:
    name: production
    url: <your website url>
  when: manual
  only:
    - master
```
