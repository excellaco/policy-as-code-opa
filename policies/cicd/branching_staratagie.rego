package cicd

# Enforce trunk-based development strategy
# Ensure that the branches are short-lived and feature-based (not long-running)
deny_long_lived_branches[reason] {
  input.ref != "refs/heads/main"
  input.ref != "refs/heads/develop"
  not startswith(input.ref, "refs/heads/feature/")
  not startswith(input.ref, "refs/heads/hotfix/")
  not is_short_lived_branch(input.ref)

  reason = sprintf("Branch %v is not a short-lived feature branch.", [input.ref])
}

# Define short-lived feature branches (less than 10 days old)
is_short_lived_branch(branch_name) {
  current_date = time.now_ns()
  branch_creation_date = input.branch_creation_date_ns  # Expect timestamp from CI/CD metadata
  
  branch_age = (current_date - branch_creation_date) / 86400000000000  # Convert ns to days
  branch_age < 10
}

# Ensure CI/CD pipeline passes before merging
deny_merge_without_successful_ci[reason] {
  input.ref == "refs/heads/main"
  input.pull_request.merged == true
  not input.pull_request.successful_ci  # Ensure CI/CD passed

  reason = "Pull request cannot be merged until all CI/CD checks pass."
}
