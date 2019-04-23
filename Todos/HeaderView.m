//
//  HeaderView.m
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "HeaderView.h"
#import "TodoColors.h"

@interface HeaderView ()


@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = TodoColors.gray.CGColor;
        
//        [self addToggleAllSwitch];
        [self addTodoTextField];
    }
    return self;
}

- (void)addTodoTextField {
    UITextField *addTextField = UITextField.new;
    addTextField.placeholder = @"What needs to be done?";
    addTextField.returnKeyType = UIReturnKeyDone;
    [self addSubview:addTextField];
    
    [addTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 30, 10, 30);
        make.edges.mas_equalTo(self).insets(padding);
    }];
    
    self.todoAddTextfeild = addTextField;
}

//- (void)addToggleAllSwitch {
//    UISwitch *toggleSwitch = UISwitch.new;
//
//    [self addSubview:toggleSwitch];
//
//    [toggleSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self);
//        make.left.mas_offset(20);
//    }];
//
//    self.toggleSwitch = toggleSwitch;
//}

@end
