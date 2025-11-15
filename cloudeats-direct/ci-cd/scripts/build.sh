name: Build and Deploy

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Set up Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    - name: Install dependencies
      run: npm install
    - name: Run Tests
      run: npm test

  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
    - uses: actions/checkout@v3
    - name: Deploy (Placeholder)
      run: echo "Deploying to AWS (fill in your script)"
