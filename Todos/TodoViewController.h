//
//  TodoViewController.h
//  Todos
//
//  Created by hudongyang on 2019/4/23.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Todo;

@interface TodoViewController : UIViewController
@property(nonatomic, strong) Todo *todo;
@end

NS_ASSUME_NONNULL_END
