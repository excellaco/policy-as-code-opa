package cicd

# Enforce trunk-based development strategy
# Ensure that the branches are short-lived and feature-based (not long-running)
deny_long_lived_branches[reason] {
  input.ref != "refs/heads/main"
  input.ref != "refs/heads/develop"  # Ensure no long-lived branches like 'develop'
  not is_short_lived_branch(input.ref)
  reason = sprintf("Branch %v is not a short-lived feature branch.", [input.ref])
}

# Define short-lived feature branches ( less than 10 days old)
is_short_lived_branch(branch_name) {
  current_date = time.now_ns()
  
  # Simulating branch creation date (this should ideally come from metadata)
  branch_creation_date = get_branch_creation_date(branch_name)
  
  branch_age = (current_date - branch_creation_date) / 86400000000000  # Convert ns to days
  branch_age < 10
}

# Ensure CI/CD pipeline passes before merging
deny_merge_without_successful_ci[reason] {
  input.ref == "refs/heads/main"
  input.pull_request.merged == true
  input.pull_request.status != "success"
  reason = "Pull request cannot be merged until CI/CD checks pass."
}

# branch creation time 
get_branch_creation_date(branch_name) = 1593474000000000000  #  timestamp,

