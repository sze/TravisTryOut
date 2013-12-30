#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
OUTPUTDIR="$PWD/build/Release-iphoneos"

ls "$HOME/Library/MobileDevice/Provisioning Profiles/"
xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APPNAME.app" -o "$OUTPUTDIR/$APPNAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"


curl http://testflightapp.com/api/builds.json \
  -F file="@$OUTPUTDIR/$APPNAME.ipa" \
  -F api_token="2d3856d1ed9e39f15b7251381b000112_MzI3MTIwMjAxMi0wMi0yMSAxNjo1NjoxNy4zODI5NTQ" \
  -F team_token="2e9e44c2d42518b9791d19595df48cfd_MzE4ODYzMjAxMy0xMi0zMCAwNTo1Nzo0NC45NDk4ODc" \
  -F distribution_lists='Internal' \
  -F notes="Go Go Distribution" \
  -F notify=True