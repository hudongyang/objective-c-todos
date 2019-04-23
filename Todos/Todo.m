//
//  Todo.m
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import "Todo.h"

@implementation Todo
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        _title = title;
        _checked = NO;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"title: %@, checked: %@", self.title, self.checked ? @"true" : @"false"];
}

@end
