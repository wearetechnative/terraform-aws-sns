variable "name" {
  description = "Unique name to assign to SNS topic."
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key to use for encrypting SNS topics. If not provided then alias/aws/sns is used as a default. Set to null to dsiable entire (not recommended!)."
  type        = string
  default = "alias/aws/sns"
}

variable "policy_allowed" {
  description = "Required policy for SNS topic."
  type = map(object({
    principal = object({
      type = string
      identities = list(string)
    })
    actions = list(string)
  }))
  default = {}
}
