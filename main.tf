resource "google_pubsub_subscription_iam_member" "pubsub_subscription_iam_members" {
  for_each = var.pubsub_subscription_iam_members

  member       = each.value.member
  role         = each.value.role
  subscription = each.value.subscription
  project      = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

