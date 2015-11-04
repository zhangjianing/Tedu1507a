//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

/** 在多玩Model层中专门创建的头文件，目的只有一个，方便其他类引入多玩的全部头文件 */
#import "DuoWanModel.h"

typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeFree,   //免费英雄
    HeroTypeAll,    //全部英雄
};

@interface DuoWanNetManager : BaseNetManager
//使用 /** 内容 */ 方式添加注释，可以让你的代码被调用时出现代码提示

/**
 *  获取免费英雄或收费英雄列表， 因为免费和收费英雄请求串十分相似，所以合写
 *
 *  @param type 请求英雄类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getHeroWithType:(HeroType)type kCompletionHandle;

/**
 *  获取英雄皮肤
 *
 *  @param heroName 要获取皮肤的英雄英文名称
 *
 *  @return 请求所在任务
 */
+ (id)getHeroSkinsWithHeroName:(NSString *)heroName kCompletionHandle;


@end













