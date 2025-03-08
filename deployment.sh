#!/bin/bash

set -e

BUILD_DIRECTORY="build/web"
DEPLOY_DIRECTORY="docs"
COMMIT_MESSAGE="Deploy On Pages"
BASE_HREF="/flutter_playground/"

build_flutter_web() {
    echo "Building Web application..."
    if ! flutter build web --base-href=$BASE_HREF; then
        echo "Flutter build failed"
        exit 1
    fi
}

deploy_to_pages() {
    echo "Deploying to GitHub Pages..."
    
    mkdir -p "$DEPLOY_DIRECTORY"
    
    rm -rf "${DEPLOY_DIRECTORY:?}/"*
    
    if ! cp -r "$BUILD_DIRECTORY"/* "$DEPLOY_DIRECTORY"; then
        echo "Failed to copy build files"
        exit 1
    fi
    
    if git add .; then
        git commit -m "$COMMIT_MESSAGE" && git push
    else
        echo "Git operations failed"
        exit 1
    fi
    
    echo "Deployment completed successfully!"
}

build_flutter_web
deploy_to_pages