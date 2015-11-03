//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XiMaNetManager.h"
#import "TuWanNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
/*喜马拉雅接口测试通过*/
    [XiMaNetManager getRankListWithPageId:1 completionHandle:^(RankingListModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [XiMaNetManager getAlbumWithId:3092772 page:1 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@""); //需要添加 text/plain 解析允许，在baseNetwork中
    }];
    
/*兔玩接口测试通过*/
    [TuWanNetManager getTuWanInfoWithType:InfoTypeTouTiao start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];

    return YES;
}

@end









