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

cat "$PWD/scripts/Template.plist" | sed -e "s/\##BUNDLEID##/$BUNDLE_IDENTIFIER/" -e "s/\##TITLE##/$APPNAME/" > "$OUTPUTDIR/$APPNAME.plist"
  
  
curl --ftp-create-dirs -T "$OUTPUTDIR/$APPNAME.plist" -u $TABETAUSR:$TABETAPWD "ftp://$TABETAURL/$APPNAME/"
curl --ftp-create-dirs -T "$OUTPUTDIR/$APPNAME.ipa" -u $TABETAUSR:$TABETAPWD "ftp://$TABETAURL/$APPNAME/"