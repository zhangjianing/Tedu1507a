//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
//很多具有共同点的东西，可以统一宏定义，比如
//凡是自己写的宏定义 都需要用k开头，这是编码习惯


//如果宏命令超长需要换行，只需要在换行位置添加 \ 即可， 最后一行不用加
#define kOSType       @"OSType": [@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion] //获取当前系统版本号

//把path写到文件头部，使用宏定义形势。 方便后期维护
#define kHeroPath  @"http://lolbox.duowan.com/phone/apiHeroes.php"    //免费+全部英雄
#define kHeroSkinPath @"http://box.dwstatic.com/apiHeroSkin.php" //英雄皮肤
//............

@implementation DuoWanNetManager

+ (id)getHeroWithType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle{
//参数错误传递提示
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, @"v": @140}];
    switch (type) {
        case HeroTypeFree: {
            [params setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll: {
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        default: {
            break;
        }
    }
    
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree: {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            case HeroTypeAll: {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            default: {
                completionHandle(nil, error);
                break;
            }
        }
    }];
}


@end

























