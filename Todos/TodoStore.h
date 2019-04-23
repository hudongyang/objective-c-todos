//
//  todoStore.h
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Todo;

@interface TodoStore : NSObject

@property(nonatomic, readonly) NSArray *todos;
@property(nonatomic, readonly) int left;

+ (instancetype)sharedStore;

- (Todo *)addTodoWithTitle: (NSString *)title;
- (void)removeTodo: (Todo *)todo;

@end

NS_ASSUME_NONNULL_END
