#!/bin/bash

# Create Umbraco project
echo "Creating Umbraco 16 project..."

# Install Umbraco templates
dotnet new install Umbraco.Templates

# Create new Umbraco project
dotnet new umbraco -n UmbracoProject --no-restore

# Move files to root directory
mv UmbracoProject/* .
mv UmbracoProject/.* . 2>/dev/null || true
rmdir UmbracoProject

# Clean up any existing packages
rm -rf obj bin

echo "Umbraco project created successfully!"