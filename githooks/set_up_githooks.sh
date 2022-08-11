#!/bin/bash

pip install pre-commit isort black flake8 interrogate
echo "Dependencies Installed"

# Remove previous hooks
git config --unset-all core.hooksPath

# Install pre-commit from .pre-commit-config.yaml
pre-commit install

# Make folder if does not exist yet
if [ ! -d ".githooks" ]; then
    mkdir .githooks
fi

# Copy pre-commits to public folder and set as hooks folder
cp .git/hooks/pre-commit .githooks/
git config core.hooksPath .githooks

# Set files as executable
chmod -R +x .githooks/

echo "Git hooks Installed"
