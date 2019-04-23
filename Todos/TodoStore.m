//
//  todoStore.m
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import "TodoStore.h"
#import "Todo.h"

@interface TodoStore ()

@property(nonatomic) NSMutableArray *privateTodos;

@end

@implementation TodoStore

+ (instancetype)sharedStore {
    static TodoStore *store = nil;
    
    if (!store) {
        store = [[self alloc] initPrivate];
    }
    
    return store;
}

-(instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        _privateTodos = NSMutableArray.array;
    }
    
    return self;
}

- (Todo *)addTodoWithTitle:(NSString *)title {
    Todo *todo = [[Todo alloc] initWithTitle:title];
    
    [self.privateTodos addObject:todo];
    
    return todo;
}

- (void)removeTodo: (Todo *)todo {
    [self.privateTodos removeObjectIdenticalTo:todo];
}

- (NSArray *)todos {
    return self.privateTodos;
}

- (int)left {
    int left = 0;
    
    for (Todo *todo in self.privateTodos) {
        if (!todo.checked) {
            left++;
        }
    }
    
    return left;
}

@end

