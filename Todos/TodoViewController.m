//
//  TodoViewController.m
//  Todos
//
//  Created by hudongyang on 2019/4/23.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "TodoViewController.h"
#import "Todo.h"

@interface TodoViewController ()

@property(nonatomic, strong) UITextField *titleField;
@property(nonatomic, strong) UISwitch *checkedSwitch;

@end

@implementation TodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addNameField];
    [self addCheckedSwitch];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.todo.title = self.titleField.text;
    self.todo.checked = self.checkedSwitch.on;
}

- (void)addNameField {
    CGRect frame = CGRectMake(30, 120, UIScreen.mainScreen.bounds.size.width - 60, 40);
    self.titleField = [[UITextField alloc] initWithFrame:frame];
    [self.view addSubview:self.titleField];
    self.titleField.placeholder = @"title";
    self.titleField.text = self.todo.title;
    self.titleField.returnKeyType = UIReturnKeyDone;
}

- (void)addCheckedSwitch {
    self.checkedSwitch = UISwitch.new;
    [self.view addSubview:self.checkedSwitch];
    
    self.checkedSwitch.on = self.todo.checked;
    
    [self.checkedSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).inset(30);
        make.top.mas_equalTo(self.titleField.mas_bottom).inset(20);
    }];
}

- (void)setTodo:(Todo *)todo {
    _todo = todo;
    self.navigationItem.title = todo.title;
}

@end
