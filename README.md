# Terraform AWS [SNS]

This module implements a simple SNS topic with all known AWS best practices enforced.

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

### First use after you clone this repository or when .pre-commit-config.yaml is updated

Run `pre-commit install` to install any guardrails implemented using pre-commit.

See [pre-commit installation](https://pre-commit.com/#install) on how to install pre-commit.

## Usage

The simplest way to use this module is by defining the least required defaults:

```hcl
module "sns_topic_example" {
   source = "git@github.com:TechNative-B-V/terraform-aws-module-sns.git?ref=962c7d04c8f7f2ce229829b2d233bc39caca5ed0"

   name = "sns_topic_example"
   kms_key_arn = module.kms.kms_key_arn
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key to use for encrypting RDS instances. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Unique name to assign to SNS topic. | `string` | n/a | yes |
| <a name="input_policy_allowed"></a> [policy\_allowed](#input\_policy\_allowed) | Required policy for SNS topic. | <pre>map(object({<br>    principal = object({<br>      type = string<br>      identities = list(string)<br>    })<br>    actions = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_arn"></a> [sns\_arn](#output\_sns\_arn) | n/a |
<!-- END_TF_DOCS -->
