# OPA Policy Repository:

This repository contains Rego policies for Open Policy Agent (OPA) used for security and access control enforcement in our infrastructure and applications and custom policy which maybe needed.

## Folder Structure
===========================================================================================
Policy-as-code-opa
   -data/
      input.json
   -policies/
      -application/
         security.rego
      -cicd/
         branching_stratagie.rego
      -custom/
         cutom_policy.rego
      -infrastructure/
         access_control.rego
=============================================================================================

      - `policies/`: Contains all the policy files written in Rego.
      - `data/`: Contains sample input data used to test the policies.
      - `opa_config.yaml`: The configuration file to run OPA with the policies and data.
      - `Dockerfile`: Containerizes the OPA with policies for easy deployment.

## Running OPA Locally

1. Build the Docker image:

   docker build -t policy-as-code-opa .
============================================================================================