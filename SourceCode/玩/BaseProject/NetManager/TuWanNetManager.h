//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//只要公用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可
//如果不会 可以参考汽车之家接口

typedef NS_ENUM(NSUInteger, InfoType) {
    InfoTypeTop,        //头条
    InfoTypeSingle,    //独家
                        //
};

@interface TuWanNetManager : BaseNetManager



@end











