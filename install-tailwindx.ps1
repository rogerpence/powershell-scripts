#!/usr/bin/env pwsh
# On Linux:
# Put install-tailwind.ps1 in
# sudo cp install-tailwind.sh /usr/local/bin
# sudo cp install-tailwind.ps1 /usr/local/bin
# sudo chmod +x /usr/local/bin/install-tailwind.sh
# sudo chmod +x /usr/local/bin/install-tailwind.ps1
# $ install-tailwind.ps1
write-host Installing Tailwind -foregroundcolor green
# Create package.json if necessary.
if (-not (Test-Path package.json -PathType Leaf)) {
    npm init -y | out-null
}
# Install Node modules.
npm install --save-dev tailwindcss autoprefixer postcss-cli postcss-import cross-env @rogerpence/edit-package-json
# Create Tailwind directory if necessary.
if (-not(Test-Path -Path "tailwind")) {
    new-item tailwind -itemtype directory | out-null
}
# Change to tailwind directory.
set-location tailwind
# Create emtpy Tailwind config file.
npx tailwind init | out-null
# Create fully-populated Tailwind config file for reference use.
npx tailwind init tailwind.config.reference.js ---full | out-null
# Create empty tailwind.base.css, tail.components.css, and tailwind.utilities.css files.
new-item my.tailwind.utilities.css, my.tailwind.components.css | out-null
# Fetch tailwind.main.css file.
invoke-webrequest -Uri "https://raw.githubusercontent.com/rogerpence/tailwind-files/main/tailwind.main.css" -Outfile tailwind.main.css
# Back to root.
set-location ..
# Fetch postcss.config.js file.
invoke-webrequest -Uri "https://raw.githubusercontent.com/rogerpence/tailwind-files/main/postcss.config.js" -Outfile .\postcss.config.js
# Create src directory if necessary.
if (-not(Test-Path -Path "src")) {
    new-item src -itemtype directory | out-null
}
# Fetch index.html file.
invoke-webrequest -Uri "https://raw.githubusercontent.com/rogerpence/tailwind-files/main/index.html" -Outfile .\src\index.html
# Add dev:tw key to package.json's scripts node.
npx editPackageJson -k "tailwind:dev" -v '""cross-env NODE_ENV=development postcss ./tailwind/tailwind.main.css -o ./dist/css/tailwind.css""' --out-null
# Create tailwind css file.
npm run tailwind:dev
write-host ------------------------------------------------ -foregroundcolor green
write-host Tailwind installed. Version shown below. -foregroundcolor green
write-host tailwind.css created in dist/css. -foregroundcolor green
write-host Launch src/index.html to see Tailwind in action. -foregroundcolor green
write-host ------------------------------------------------ -foregroundcolor green
npx tailwind --version
# Launch index.html with default browser.
if ($IsWindows) {
    Start-Process "$($pwd)/src/index.html"
}
elseif ($IsLinux) {
    xdg-open "$($pwd)/src/index.html"
}
else {
    # On the Mac. Do something here.
}
