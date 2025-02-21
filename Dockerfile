FROM openpolicyagent/opa:latest

# Copy the policies and data
COPY policies /policies
COPY data /data

# Start OPA with the policy and data files
CMD ["run", "--server", "--set", "decision_logs.console=true", "--set", "bundle.application.resource=/policies", "--set", "bundle.application.revision=1"]
