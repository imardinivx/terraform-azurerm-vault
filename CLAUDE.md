# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **Terraform module** for creating Azure Key Vault resources. It uses **release-please** for automated semantic versioning and releases.

## Commands

### Validate Module
```bash
terraform fmt -check
terraform init -backend=false
terraform validate
```

### Format Code
```bash
terraform fmt
```

## Architecture

Single-module repository following standard Terraform layout:
- `main.tf` - Azure Key Vault resource definition
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `versions.tf` - Terraform and provider version constraints

## Workflows

### Release (release-please)
- Triggers on push to `main`
- Analyzes commits for semantic version bumps
- Creates a Release PR with changelog
- Merge the PR to create a GitHub release and tag

### CI
- Runs on PRs and pushes to `main`
- Validates: `terraform fmt -check`, `terraform init`, `terraform validate`

### Docs
- Triggers when `.tf` files change on `main`
- Auto-updates README.md between `<!-- BEGIN_TF_DOCS -->` markers using terraform-docs

## Commit Convention

Use conventional commits for release-please to detect version bumps:
- `feat: ...` - Minor version bump
- `fix: ...` - Patch version bump
- `feat!: ...` or `BREAKING CHANGE:` - Major version bump
