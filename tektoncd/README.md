# TektonCD pipelines to build sample app

Folder build-git contains definitions to create Tekton resources to build a sample app.

It is suggested to install [tekton cli tool](https://github.com/tektoncd/cli)

## Steps to run
Apply all resources:
`kubectl apply -f build-git/`

Inspect the pipeline result:
`tkn pipelinerun logs output-pipeline-run`

To re-run the pipeline if any changes to the resources have been done, delete and re-apply the resources
