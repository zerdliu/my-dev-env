#!/bin/bash

echo "Step 1: install init development env, editor, source code tools , ruby , gems, curl"
software_list=(
vim
git
curl
ruby
rubygems
)

for x in ${software_list[@]} ; do
    echo "--install $x"
    sudo apt-get install $x -y
done

echo "Step 2: install rvm , and ruby1.9.3"
curl -L https://get.rvm.io | bash -s stable --ruby
/bin/bash --login
rvm install 1.8.7
rvm install 1.9.3
rvm use 1.9.3

echo "Step 3: install chef , and configure chef-client"
gem source --add http://ruby.taobao.org
gem source --remove http://rubygems.org/
gems_list=(
rake
chef
)

for x in ${gems_list[@]} ; do
    echo "--install $x"
    sudo gem install $x
done

echo "Step 4: config chef-client"
git clone git@github.com:zerdliu/chef-repo.git
cd ~/chef-repo
rm -rf ~/.chef && cp -r .chef ~/
cp ./client-config/* /etc/chef/
sudo chef-client

