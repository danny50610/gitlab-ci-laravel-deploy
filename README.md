# gitlab-ci-laravel-deploy

```
deploy_production:
  tags:
    - deploy
  stage: deploy
  image: danny50610/gitlab-ci-laravel-deploy
  dependencies: []
  script:
    - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
    - eval $(ssh-agent -s)
    - ssh-add <(echo "$SSH_PRIVATE_KEY")
    - mkdir -p ~/.ssh
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'

    - ~/.composer/vendor/bin/envoy run deploy
  environment:
    name: production
    url: <your website url>
  when: manual
  only:
    - master
```