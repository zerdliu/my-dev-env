#!/bin/bash

echo "Step 1: install init development env, editor, source code tools , ruby , gems, curl"
software_list=(
vim
git
ruby
rubygems
curl
)

for x in ${software_list[@]} ; do
    echo "--install $x"
    sudo apt-get install $x -y
done

echo "Step 2: install rvm , and ruby1.8.7"
curl -L https://get.rvm.io | bash -s stable --ruby
/bin/bash --login
rvm install 1.8.7

echo "Step 3: install chef , and configure chef-client"
gems_list=(
rake
chef
)

gem source --add http://ruby.taobao.org
gem source --remove http://rubygems.org/

for x in ${gems_list[@]} ; do
    echo "--install $x"
    gem install $x
done