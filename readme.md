# Terraform DigitalOcean Project

This project uses Terraform to manage infrastructure on DigitalOcean.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- A DigitalOcean account and API token.

## Project Structure

- `main.tf`: Contains the main configuration for Terraform, including provider settings and resource definitions.
- `variable.tf`: Defines the input variables used in the Terraform configuration.
- `terraform.tfvars`: Contains the values for the input variables.
- `outputs.tf`: Specifies the outputs of the Terraform configuration.

## Variables

The following variables are defined in `variable.tf`:

- `ssh_fingerprint`: The fingerprint of the SSH key to use for the Droplet.
- `do_token`: The DigitalOcean API token.

## Resources

The following resources are defined in `main.tf`:

- `digitalocean_vpc.main`: Creates a new Virtual Private Connection (VPC) in the `nyc3` region.
- `digitalocean_droplet.host2`: Creates a Droplet named `host2.example.com` in the `nyc3` region.
- `digitalocean_droplet.host3`: Creates a Droplet named `host3.example.com` in the `nyc3` region.

## Outputs

The following outputs are defined in `outputs.tf`:

- `host2_specs`: Outputs the specifications of the `host2` Droplet.
- `host3_specs`: Outputs the specifications of the `host3` Droplet.

## Usage

1. Initialize the Terraform configuration:

    ```sh
    terraform init
    ```

2. Apply the Terraform configuration:

    ```sh
    terraform apply
    ```

3. Review the outputs to get the details of the created resources.

## Cleanup

To destroy the resources created by this Terraform configuration, run:

```sh
terraform destroy