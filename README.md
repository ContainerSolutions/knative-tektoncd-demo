# CICD capabilities of Knative Build and TektonCD

This repository contains several demos regarding Knative Build and TektonCD. The goal is to explore the Knative Build capabilities and compare with TektonCD which is currently under evaluation to officially replace the Knative Build component.

## Getting Started

There are three demos in this repository.
- Knative build using Kaniko that pulls the code from a public repository
- Knative build using Kaniko that pulls the code from a private repository
- TektonCD pipeline that uses a public repository

### Prerequisites

For all demos, Google Cloud Platform and specifically GKE was used as the underlying Kubernetes cluster. Also, Google Cloud Build was used as the service to trigger a deployment after a certain tag is pushed. 

Also, appropriate service accounts need to be created on GKE and on GCP to allow Knative to push/pull images in GCR. Finally, two triggers on Google Cloud Build need to be setup after GCP is authenticated in Github and allowed to pull code from the chosen repository.


## Running the demos

Every demo can be trigger by pushing a certain git tag that can be defined during the Google Cloud Build trigger creation. For example, assuming the trigger expects the tag knative, the following commands should be executed:
```
git tag knative
git push origin knative
```

That will trigger a build which will eventually apply the respective Knative or TektonCD pipelineRun manifest.

### Deleting the resources

The resources are not automatically cleaned up therefore they must be manually deleted. This is key as a consecutive cloud build on the same running resource will fail.

## Deployment

Add additional notes about how to deploy this on a live system

## Authors

* **Andreas Krivas** - *Initial work* - [GitHub](https://github.com/andreas131989)

* **Aleksandr Guljajev** - *Initial work* - [GitHub](https://github.com/alex-glv)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details