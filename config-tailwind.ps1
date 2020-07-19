# Create package.json.
if (-not (Test-Path package.json -PathType Leaf)) {
    npm init -y
}

# Install Node modules.
npm install --save-dev tailwindcss autoprefixer postcss-cli cross-env @rogerpence/edit-package-json

# Create Tailwind directory.
new-item tailwind -itemtype directory
# Change to tailwind directory.
set-location tailwind
# Create emtpy Tailwind config file.
npx tailwind init
# Create fully-populated Tailwind config file for reference use.
npx tailwind init tailwind.config.reference.js
# Create empty tailwind.base.css, tail.components.css, and tailwind.utilities.css files.
new-item tailwind.base.css, tailwind.components.css, tailwind.utilities.css
# Fetch tailwind.main.css file.
invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/d2c187dd3f858addcbb6f6d46768ff73/raw/20cc2bc19bffc2bb97918f46c2ef03c14226a3a8/tailwind.main.css" -Outfile tailwind.main.css
# Back to root.
set-location ..

# Fetch postcss.config.js file.
invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/bd227c526dfe47de41d731874d820acf/raw/deb5badeaf5afa2e140ea602bd974c805aebde98/postcss.config.js" -Outfile .\postcss.config.js

# Create src directory.
new-item src -itemtype directory
# Change to src directory.
set-location src
# Fetch index.html file.
invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/522bcf7d130d3fa30c0a7ed252e0bc62/raw/f6ae7302230dfa433e97b642a3561eae86cbfe47/basic%2520index.html%2520for%2520testing%2520Tailwind" -Outfile .\index.html
# Back to root.
set-location ..

# Add dev:tw key to package.json's scripts node.
npx editpackagejson -k "dev:tw" -v '""cross-env NODE_ENV=development postcss ./tailwind/tailwind.main.css -o ./dist/css/tailwind.css""'
# $devScript = "let npmAddScript = require('npm-add-script');npmAddScript({`"key`": `"dev:tw`", `"value`" : `"cross-env NODE_ENV=development postcss ./tailwind/tailwind.main.css -o ./dist/css/tailwind.css`", `"force`": true });"
# set-content -path addkey.js -value $devscript
# node addkey.js
# remove-item addkey.js

# Create tailwind css file.
npm run dev:tw
write-host tailwind.css created in dist/css -foregroundcolor green

# # Launch
# $dir = $pwd
# $indexFile = "$($dir)\src\index.html"
# [system.Diagnostics.Process]::Start("firefox",$indexFile)