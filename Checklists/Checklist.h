//
//  Checklist.h
//  Checklists
//
//  Created by 黄舸 on 15-3-9.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property(nonatomic,strong) NSMutableArray *items;

@end
