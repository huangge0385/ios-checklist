//
//  ChecklistItem.m
//  Checklists
//
//  Created by 黄舸 on 15-3-9.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

-(void)toggleChecked{
    self.checked = !self.checked;
}

@end
