#!/bin/bash

# This script clones the recipes source into the source folder,
# the endpoint files into the flex-endpoint folder,
# and gets the recipes checker script that can convert one into the other.

git clone https://github.com/redantnl/recipes.git -b source source
git clone https://github.com/redantnl/recipes.git -b main flex-endpoint
git clone https://github.com/symfony-tools/recipes-checker.git recipes-checker
cd recipes-checker
composer install

# Compile the new endpoint ...

cd ../source
git ls-tree HEAD */*/* | ../recipes-checker/run generate:flex-endpoint redant/recipes source main ../flex-endpoint --contrib

# ... and show the changes

cd ../flex-endpoint
git status
