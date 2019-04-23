//
//  Todo.h
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property(nonatomic) NSString *title;
@property(nonatomic) BOOL checked;

-(instancetype)initWithTitle: (NSString *)title;

@end

NS_ASSUME_NONNULL_END
