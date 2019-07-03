# Instructions

This folder contains manifests that deploy working demos in Knative with the use of Kaniko as a builder image.

How to use the files:

* The kanikotemplate.yaml applies a knative build template which is used when a build is triggered. In this file, we specify the dockerfile location and the remote registry to push the container image.
* The kanikobuild.yaml contains a knative build definition that can be applied directly to the cluster. This will create a knative build which will fetch the code from a public git repo, build the container image in a Kaniko pod and finally push the image to a GCR registry.
* The kanikoserve.yaml deploys a knative service directly to the cluster. It performs all the above steps plus pulling the application image from the GCR registry and deploying the service in Knative.
* The cloudbuild.yaml is a GCP Cloud Build definition that can be used to trigger a build from a git push. If a revision is pushed with the tag "release-v*", it will trigger automatically the kanikoserve.yaml in the GKE cluster.