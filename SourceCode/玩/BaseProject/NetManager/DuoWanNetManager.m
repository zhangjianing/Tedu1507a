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

//免费+全部英雄
#define kHeroPath           @"http://lolbox.duowan.com/phone/apiHeroes.php"

//英雄皮肤
#define kHeroSkinPath       @"http://box.dwstatic.com/apiHeroSkin.php"

//英雄配音
#define kHeroSoundPath      @"http://box.dwstatic.com/apiHeroSound.php"

//英雄视频
#define kHeroVideoPath      @"http://box.dwstatic.com/apiVideoesNormalDuowan.php"

//英雄出装
#define kHeroCZPath         @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php"

//英雄资料
#define kHeroDetailPath     @"http://lolbox.duowan.com/phone/apiHeroDetail.php"

//英雄排行
#define kHeroTop10Path      @"http://lolbox.duowan.com/phone/heroTop10PlayersNew.php"

//天赋符文
#define kGiftAndRunPath     @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php"

//英雄改动
#define kHeroInfoPath       @"http://db.duowan.com/boxnews/heroinfo.php"

//一周数据
#define kHeroWeekDataPath   @"http://183.61.12.108/apiHeroWeekData.php"

//游戏百科列表
#define kToolMenuPath       @"http://box.dwstatic.com/apiToolMenu.php"

//装备分类
#define kZBCategoryPath     @"http://lolbox.duowan.com/phone/apiZBCategory.php"

//某装备分类内容
#define kZBItemListPath     @"http://lolbox.duowan.com/phone/apiZBItemList.php"

//装备详情
#define kItemDetailPath     @"http://lolbox.duowan.com/phone/apiItemDetail.php"

//天赋
#define kGiftPath           @"http://lolbox.duowan.com/phone/apiGift.php"

//符文列表
#define kRunesPath          @"http://lolbox.duowan.com/phone/apiRunes.php"

//召唤师技能列表
#define kSumAbilityPath     @"http://lolbox.duowan.com/phone/apiSumAbility.php"

//最佳阵容
#define kBestGroupPath      @"http://box.dwstatic.com/apiHeroBestGroup.php"

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

























