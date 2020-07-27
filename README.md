# kustomize-playground

Repository meant to play with Kustomize while learning it.

## Technologies used

- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [kustomize](https://kustomize.io)

## Structure of this repository

For each service in this repository, the following structure is used:
> ```
> ~/someApp
> ├── base
> │   ├── deployment.yml
> │   ├── kustomization.yml
> │   └── service.yml
> └── overlays
>     ├── dev
>     │   ├── cpu_count.yml
>     │   ├── kustomization.yml
>     │   └── replica_count.yml
>     └── prod
>         ├── cpu_count.yml
>         ├── kustomization.yml
>         └── replica_count.yml
> ```

## Build a kustomize configuration

It is quite simple to build a kustomize configuration. In the following example we're going build the `mysql` `staging` configuration in the `output_staging.yml` file:
```console
$ kustomize build ./mysql/overlays/staging > output_staging.yml
...
```

## Apply a kustomize configuration

For example, if you wanted to apply the `mysql` `staging` configuration, you would want to run this command:
```console
$ kubectl apply -k mysql/overlays/staging
...
```
