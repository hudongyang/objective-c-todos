//
//  TodosViewController.m
//  Todos
//
//  Created by hudongyang on 2019/4/18.
//  Copyright © 2019 hudongyang. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "TodosViewController.h"
#import "TodoViewController.h"
#import "TodoStore.h"
#import "TodoColors.h"
#import "HeaderView.h"
#import "Todo.h"

@interface TodosViewController ()<UITextFieldDelegate>

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) HeaderView *headerView;
@property(nonatomic, strong) UIView *footerView;
@property(nonatomic) UILabel *remainLabel;

@end

@implementation TodosViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Todos";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        [TodoStore.sharedStore addTodoWithTitle:@"Vue"];
        [TodoStore.sharedStore addTodoWithTitle:@"Objective-c"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TodoColors.gray;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    
    self.headerView.todoAddTextfeild.delegate = self;
    [self.tableView setTableHeaderView:self.headerView];
    [self.tableView setTableFooterView:self.footerView];
    
    [self addFooterSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    [self updateFooter];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return TodoStore.sharedStore.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    Todo *todo = TodoStore.sharedStore.todos[indexPath.row];
    
    cell.textLabel.text = todo.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Todo *todo = TodoStore.sharedStore.todos[indexPath.row];
        
        [TodoStore.sharedStore removeTodo:todo];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoViewController *todoViewController = TodoViewController.new;
    todoViewController.todo = TodoStore.sharedStore.todos[indexPath.row];
    
    [self.navigationController pushViewController:todoViewController animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSString *title = textField.text;
    
    if ([title isEqualToString:@""]) {
        return YES;
    }
    
    NSInteger *lastRow = TodoStore.sharedStore.todos.count;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [TodoStore.sharedStore addTodoWithTitle:title];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    textField.text = @"";
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)addTitle {
    UILabel *titleLabel = UILabel.new;
    
    titleLabel.text = @"Todos";
    titleLabel.textColor = TodoColors.lightRed;
    titleLabel.font = [UIFont systemFontOfSize:80];
    
    [titleLabel sizeToFit];
    
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.inset(80);
        make.centerX.equalTo(self.view);
    }];
    
    self.titleLabel = titleLabel;
}

- (void)updateFooter {
    self.remainLabel.text = [NSString stringWithFormat:@"%d items left", TodoStore.sharedStore.left];
}

- (void)addFooterSubViews {
    UILabel *remainLabel = self.remainLabel = UILabel.new;
    
    [self.footerView addSubview:remainLabel];
    
    [remainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView);
        make.left.equalTo(self.footerView).inset(15);
    }];
}

- (UIView *)footerView {
    if (!_footerView) {
        CGRect frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 60);
        _footerView = [[UIView alloc] initWithFrame:frame];
        _footerView.backgroundColor = UIColor.whiteColor;
    }
    
    return _footerView;
}

- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 65)];
        _headerView.backgroundColor = UIColor.whiteColor;
    }
    
    return _headerView;
}

@end
