//
//  DevMenuBuildInfo.m
//  expo-dev-menu-EXDevMenu
//
//  Created by andrew on 2022-01-10.
//

#import "EXDevMenuBuildInfo.h"

@implementation EXDevMenuBuildInfo

+(NSDictionary *)getBuildInfoForBridge:(RCTBridge *)bridge andManifest:(NSDictionary *)manifest
{
  NSMutableDictionary *buildInfo = [NSMutableDictionary new];

  NSString *appIcon = [EXDevMenuBuildInfo getAppIcon];
  NSString *runtimeVersion = [EXDevMenuBuildInfo getUpdatesConfigForKey:@"EXUpdatesRuntimeVersion"];
  NSString *sdkVersion = [EXDevMenuBuildInfo getUpdatesConfigForKey:@"EXUpdatesSDKVersion"];
  NSString *appVersion = [EXDevMenuBuildInfo getFormattedAppVersion];
  NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDisplayName"] ?: [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleExecutable"];
  NSString *hostUrl = [bridge.bundleURL host] ?: @"";

  if ([manifest objectForKey:@"name"] != nil) {
    appName = [manifest objectForKey:@"name"];
  }
  
  if ([manifest objectForKey:@"version"] != nil) {
    appVersion = [manifest objectForKey:@"version"];
  }
  
  if ([manifest objectForKey:@"bundleUrl"] != nil) {
    hostUrl = [manifest objectForKey:@"bundleUrl"];
  }

  [buildInfo setObject:appName forKey:@"appName"];
  [buildInfo setObject:appIcon forKey:@"appIcon"];
  [buildInfo setObject:appVersion forKey:@"appVersion"];
  [buildInfo setObject:runtimeVersion forKey:@"runtimeVersion"];
  [buildInfo setObject:sdkVersion forKey:@"sdkVersion"];
  [buildInfo setObject:hostUrl forKey:@"hostUrl"];

  return buildInfo;
}

+(NSString *)getAppIcon
{
  NSString *appIcon = @"";
  NSString *appIconName = [[[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIcons"] objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"]  lastObject];
  
  if (appIconName != nil) {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *appIconPath = [[resourcePath stringByAppendingString:appIconName] stringByAppendingString:@".png"];
    appIcon = [@"file://" stringByAppendingString:appIconPath];
  }
  
  return appIcon;
}

+(NSString *)getUpdatesConfigForKey:(NSString *)key
{
  NSString *value = @"";
  NSString *path = [[NSBundle mainBundle] pathForResource:@"Expo" ofType:@"plist"];
  
  if (path != nil) {
    NSDictionary *expoConfig = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (expoConfig != nil) {
      value = [expoConfig objectForKey:key] ?: @"";
    }
  }

  return value;
}

+(NSString *)getFormattedAppVersion
{
  NSString *shortVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString *buildVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
  NSString *appVersion = [NSString stringWithFormat:@"%@ (%@)", shortVersion, buildVersion];
  return appVersion;
}

@end
