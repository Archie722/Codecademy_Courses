#!/bin/bash
echo "Test release script"
firstline=$(head -n1 source/changelog.md)
# echo $firstline
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo $version
echo "Do you want to exit the script and make changes to this version? Enter 1 to continue, 0 to exit."
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  files=source/*
  for file in $files; do
    if [ $file == "source/secretinfo.md" ]
    then
      echo "The filename $file is not being copied."
    else
      echo "The file $file is being copied"
      cp $file ./build
    fi
  done
cd build
echo "The files below are currently in the build directiory: Version: $version"
ls
cd ..
else
  echo "Please come back when you are ready."
fi

