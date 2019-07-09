# TektonCD pipelines to build sample app

Folder build-git contains definitions to create Tekton resources to build a sample app.

It is suggested to install [tekton cli tool](https://github.com/tektoncd/cli)

## Steps to run
Apply all resources:
`kubectl apply -f build-git/`

Inspect the pipeline result:
`tkn pipelinerun logs output-pipeline-run`

To re-run the pipeline if any changes to the resources have been done, delete and re-apply the resources

## Current issues

For some reason using builder service account doesn't permit kaniko to push image to gcr

`tkn pipelinerun logs output-pipeline-run`

Returns:
```
[...]
[build-docker-image : build] error pushing image: failed to push to destination gcr.io/knative-test-244411/hello-world:latest: DENIED: Access denied.
```

Possible solutions:
Mount dockercfg and run with unprivileged service account, as per this repo:
https://github.com/tektoncd/pipeline/tree/master/tekton
