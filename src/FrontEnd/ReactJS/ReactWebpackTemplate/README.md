# Add folder structure

/build
/src
index.html
.gitignore

# Initialize Git

> git init

# Initialize npm

> npm init -y

# Install Dependences

> npm install react react-dom

## Install Dev Dependences for Typescript

> npm install -D typescript @types/react @types/react-dom

## Add configuration for typescript compiler

> npm install -D @babel/core @babel/preset-env @babel/preset-react @babel/preset-typescript @babel/plugin-transform-runtime

## Install webpack

> npm install -D webpack webpack-cli webpack-dev-server html-webpack-plugin

## Install babel loader

> npm install -D babel-loader

## Install css and style loader for CSS

> npm install -D css-loader style-loader

## Webpack configuration merger

> npm install -D webpack-merge

## Install ESLint

Install VSCode Plugin ESLint

> npm install -D eslint
> npm install -D eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-eslint-comments
> npm install -D @typescript-eslint/parser @typescript-eslint/eslint-plugin
> npm install -D eslint-plugin-import eslint-plugin-jsx-a11y

## Install Pretier

Install VSCode Plugin Prettier

> npm install -D prettier eslint-config-prettier eslint-plugin-prettier

## Prevent Commit to repo with Linting or Formatting Errors

> npm install -D husky@4 lint-staged

## Babel Additional

> npm install -D @babel/runtime @babel/plugin-transform-runtime

## Copy Plugin - For copying assests to the build folder

> npm install -D copy-webpack-plugin

# Running the react project

## Running the dev

> npm run dev

This will start the webserver at localhost:8080

## Running the build

> npm run build

This will build the react codes and put the output in the /build folder

Go to the /build folder and run

> npx serve

To run with your desired port

> npx serve -p [PORT_NUMBER]
