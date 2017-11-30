# happy-randomizer-terraform

This repository is an extension of the [Happy Randomizer](https://github.com/heyawhite/happy-randomizer), to deploy the application on [Triton](https://www.joyent.com/triton/compute) with [Terraform](https://www.terraform.io/intro/index.html).

## Prerequisites

1. Sign up for a [Triton account](https://lpage.joyent.com/Triton-Free-Trial.html). 
1. Create the Happy Randomizer images. The Packer configuration file is [already included in the GitHub repo](https://github.com/heyawhite/happy-randomizer/blob/master/happy-image.json) and if unmodified, it will create an image named `happy_randomizer` version 1.0.0.
   + Read more instructions on how to [create images with Packer](https://www.joyent.com/blog/create-images-with-packer), you're in luck. 
   + You'll need version 1.0 and version 1.1 of the Happy Randomizer. Details are in the repository's README.
1. Once the images have been deployed, fork this repository.
   + The files refer to the images already deployed to Triton and do not require the local application.
1. To use the environment variables, you must be in the Triton environment before initializing Terraform.
   ```sh
   $ eval "$(triton env)"
   ```

## Troubleshooting

If you receive an error similar to:

```sh
* provider.triton: Error Creating SSH Agent Signer: No key in the SSH Agent matches fingerprint: <ssh fingerprint>
```

Use `ssh-add` to fix it:

```sh
ssh-add <path to ssh key>
```

## Additional resources

+ [Triton Terraform provider docs](https://github.com/terraform-providers/terraform-provider-triton)
+ [Triton CLI and CloudAPI documentation](https://docs.joyent.com/public-cloud/api-access/cloudapi)
+ Read more tutorials on the [Joyent blog](https://www.joyent.com/blog)