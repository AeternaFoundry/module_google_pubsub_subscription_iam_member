variable "pubsub_subscription_iam_members" {
  description = <<EOT
Map of pubsub_subscription_iam_members, attributes below
Required:
    - member
    - role
    - subscription
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member       = string
    role         = string
    subscription = string
    project      = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

