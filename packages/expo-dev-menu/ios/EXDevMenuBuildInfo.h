//
//  DevMenuBuildInfo.h
//  expo-dev-menu-EXDevMenu
//
//  Created by andrew on 2022-01-10.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>
#import <EXManifests/EXManifestsManifestFactory.h>



NS_ASSUME_NONNULL_BEGIN

@interface EXDevMenuBuildInfo : NSObject

+(NSDictionary *)getBuildInfoForBridge:(RCTBridge *)bridge andManifest:(id)manifest;

@end

NS_ASSUME_NONNULL_END
