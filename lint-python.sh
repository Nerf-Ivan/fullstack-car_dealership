#!/bin/bash

# Simple Python linting script as fallback
# This script performs basic syntax checks on Python files

echo "Running basic Python syntax checks..."

# Check for common syntax issues
for file in $(find . -name "*.py" -not -path "./node_modules/*" -not -path "./server/frontend/node_modules/*" -not -path "./.venv/*" -not -path "./server/djangoenv/*"); do
    if [ -f "$file" ]; then
        echo "Checking $file..."
        
        # Check for basic syntax errors using python
        if python -m py_compile "$file"; then
            echo "✓ $file - Syntax OK"
        else
            echo "✗ $file - Syntax errors found"
            exit 1
        fi
    fi
done

echo "All Python files passed basic syntax checks!"
