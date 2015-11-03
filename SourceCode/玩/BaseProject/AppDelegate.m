//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "TuWanModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
    NSString *path = @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking:album:played:1:2&pageId=2&pageSize=20&position=0&title=排行榜";
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@"2", @"pageId":@"2", @"pageSize": @20, @"position": @0, @"title": @"排行榜"};
    
    
    [BaseNetManager GET:@"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album" parameters:params completionHandler:^(id responseObj, NSError *error) {
        DDLogVerbose(@"...........");
    }];
    

    return YES;
}

@end









