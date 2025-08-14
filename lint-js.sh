#!/bin/bash

# Simple JavaScript linting script as fallback
# This script performs basic syntax checks on JavaScript files

echo "Running basic JavaScript syntax checks..."

# Check for common syntax issues
for file in ./server/database/*.js; do
    if [ -f "$file" ]; then
        echo "Checking $file..."
        
        # Check for basic syntax errors using node
        if node -c "$file"; then
            echo "✓ $file - Syntax OK"
        else
            echo "✗ $file - Syntax errors found"
            exit 1
        fi
    fi
done

echo "All JavaScript files passed basic syntax checks!"
