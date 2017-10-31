//
//  ICMainViewController.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICMessageView.h"
#import "ICChatBoxView.h"
#import "ICMenuView.h"
#import "ICInputView.h"
#define WINDOWH
@interface ICMainViewController ()
@property (nonatomic, strong)ICMenuView *menuView;
@property (nonatomic, strong)ICMessageView *messageView;
@property (nonatomic, strong)ICChatBoxView *chatBoxView;
@property (nonatomic, strong)ICInputView *inputView;
@end

@implementation ICMainViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSWindow *window = [NSApplication sharedApplication].windows.firstObject;
    CGRect frame = window.frame;
    frame.size.width = 780;
    frame.size.height = 500;

    [window setFrame:frame display:YES];
    
    [window setMinSize:NSMakeSize(780, 500)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"主页面");
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.messageView];
    [self.view addSubview:self.chatBoxView];
    [self.view addSubview:self.inputView];
    self.menuView.layer.backgroundColor = [NSColor grayColor].CGColor;
    self.messageView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    self.chatBoxView.layer.backgroundColor = [NSColor orangeColor].CGColor;
    self.inputView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    self.inputView.menuView.layer.backgroundColor = [NSColor blueColor].CGColor;
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(70);
    }];
    
    [self.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.menuView.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(260);
    }];
    
    [self.chatBoxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.messageView.mas_right);
        make.bottom.equalTo(self.inputView.mas_top);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chatBoxView.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(155);
    }];
    
    
    [[ICNetworkManager sharedInstance] login:@{} success:^(id object) {
        NSLog(@"ceshi");
    } failure:^(NSError *error) {
        NSLog(@"ceshi --- %@", error);
    }];
}

-(ICMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[ICMenuView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    }
    return _menuView;
}

-(ICMessageView *)messageView {
    if (!_messageView) {
        _messageView = [[ICMessageView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    }
    return _messageView;
}

-(ICChatBoxView *)chatBoxView {
    if (!_chatBoxView) {
        _chatBoxView = [[ICChatBoxView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    }
    return _chatBoxView;
}

-(ICInputView *)inputView {
    if (!_inputView) {
        _inputView = [[ICInputView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    }
    return _inputView;
}

@end
