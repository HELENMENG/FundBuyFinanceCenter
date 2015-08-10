//
//  HeloPortal.m
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/10.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import "HeloPortal.h"
static HeloPortal *_portal = nil;

@implementation HeloPortal
+ (HeloPortal*)share {
    @synchronized(self){
        if (_portal == nil) {
            _portal = [[HeloPortal alloc] init];
        }
    }
    return _portal;
}
-(id)init{
    self=[super init];
    if (self) {
    }
    return self;
    
}

@end
