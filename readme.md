# FHIR IG – Build & Deployment

This repository contains a FHIR Implementation Guide (IG) and two GitHub Actions workflows:

1. **Build & Push Builder Image** – builds a reusable Docker image with all IG tooling
2. **Build & Publish IG to S3** – uses that image to build and publish the IG

The design goal is **deterministic, reproducible IG builds** with zero toolchain setup on CI runners.

---

## Repository layout

```
.
├── TASMC/                 # FHIR Implementation Guide root
│   ├── input/
│   ├── fsh/
│   ├── ig.ini
│   └── output/            # Generated IG (cleaned on every build)
├── Dockerfile             # IG Builder image
└── .github/workflows/
```

---

## Workflow 1: Build & Publish IG Builder Image

**Purpose**

Builds a Docker image that contains:
- Java
- FHIR IG Publisher
- SUSHI
- Node / Ruby / Jekyll
- All other IG build dependencies

This image is published to GitHub Container Registry (GHCR) and reused by the IG build workflow.

**Trigger**
- Manual (`workflow_dispatch`)

**Output**
- Docker image pushed to GHCR

```
ghcr.io/<owner>/ig-builder:latest
```

**Notes**
- Tool versions are intentionally pinned
- This workflow can be disabled once the image is built and validated

---

## Workflow 2: Build & Deploy IG

**Purpose**

Builds the FHIR IG **inside the builder Docker image** and deploys the generated output to S3.

**Trigger**
- Push to `main`
- Manual (`workflow_dispatch`)

**Steps**
1. Checkout repository
2. Authenticate to GHCR
3. Pull IG Builder image
4. Clean `TASMC/output`
5. Build IG inside the container
6. Sync output to S3

**Deployment target**

```
s3://<bucket>/current
```

---

## Local build (same as CI)

To build the IG locally using the same container as CI:

```bash
docker run --rm -v "$PWD:/work" ghcr.io/<owner>/ig-builder:latest -ig TASMC
```

**Notes**
- Repository root is mounted to `/work`
- `TASMC` is passed as the IG directory
- Output is written to `TASMC/output`

This is **1:1 identical** to the GitHub Actions build.

---

## AWS credentials

The deployment workflow uses **static AWS credentials** stored as GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `S3_BUCKET`

No AWS tooling is required locally unless deploying manually.

---

## Design principles

- No tool installation in CI
- Reproducible, pinned toolchain
- Containerized IG builds
- Clean output on every run
- CI behavior identical to local builds

---

## Notes

- SUSHI version warnings are informational only
- Tool upgrades are done by rebuilding the builder image
- The builder workflow can be disabled after publishing the image
