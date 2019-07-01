# CICD capabilities of Knative

So far, the following have been investigated:

- Knative build that fetches code from a public github repo, builds the container image and pushes it in a docker hub repository.
- Knative build that fetches code from a private github repo, builds the container image and pushes it to GCR private registry (some access issues here)
- Knative build template that uses Kaniko - a tool that builds container images in a K8s pod. That way, docker dependence is removed
- Cloud Native Build (cnb) template that performs a series of tests to build and push image in Docker, GCP, ACR or ECR.


Todo

- Solve the access issues while fetching from private github repo and pushing to GCR. - Done
- Knative service manifest that builds from a template and deploys to GKE - Done
- Choose an application to use for the demo (preferably written in Go)
- See how to incorporate tests in the build pipeline
- See if it is possible to trigger a knative build with a git push
- Create e2e demo with automated build and deployment