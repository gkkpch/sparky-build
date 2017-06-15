#!/bin/bash
cd $HOME
echo "Cloning sparkysbc linux repo"
git clone http://github.com/sparkysbc/linux sparky-linux
echo "Cloning volumio build repo"
git clone http://github.com/volumio/Build volumio-build
echo "Moving default platform files into volumio-build"
cd sparky-build
cp -r platform-sparky/ ../volumio-build
echo "Done..."
