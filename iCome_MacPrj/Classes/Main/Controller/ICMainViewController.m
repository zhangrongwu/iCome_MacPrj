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
#import "ICMessageTableHeaderView.h"
#define WINDOWH
@interface ICMainViewController ()<SRWebSocketDelegate>
@property (nonatomic, strong)ICMenuView *menuView;
@property (nonatomic, strong)ICMessageTableHeaderView *headerView;
@property (nonatomic, strong)ICMessageView *messageView;
@property (nonatomic, strong)ICChatBoxView *chatBoxView;
@property (nonatomic, strong)ICInputView *inputView;

@property (nonatomic, strong)SRWebSocket *webSocket;
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
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.messageView];
    [self.view addSubview:self.chatBoxView];
    [self.view addSubview:self.inputView];
    self.menuView.layer.backgroundColor = [NSColor grayColor].CGColor;
    self.messageView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    self.chatBoxView.layer.backgroundColor = [NSColor orangeColor].CGColor;
    self.inputView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    self.inputView.menuView.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(70);
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.menuView.mas_right);
        make.width.mas_equalTo(260);
        make.height.mas_equalTo(40);
    }];
    
    [self.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
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
    
    _webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"https://websocket-icome.enncloud.cn:6303"]];
    _webSocket.delegate = self;
    
    self.title = @"Opening Connection...";
    [_webSocket open];
}
///--------------------------------------
#pragma mark - SRWebSocketDelegate
///--------------------------------------

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    NSLog(@"Websocket Connected");
    self.title = @"Connected!";
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    NSLog(@":( Websocket Failed With Error %@", error);
    
    self.title = @"Connection Failed! (see logs)";
    _webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessageWithString:(nonnull NSString *)string
{
    NSLog(@"Received \"%@\"", string);
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    NSLog(@"WebSocket closed");
    self.title = @"Connection Closed! (see logs)";
    _webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload;
{
    NSLog(@"WebSocket received pong");
}

-(ICMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[ICMenuView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
    }
    return _menuView;
}

-(ICMessageTableHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[ICMessageTableHeaderView alloc] initWithFrame:CGRectMake(20, 20, 260, 40)];
        _headerView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    }
    return _headerView;
}

-(ICMessageView *)messageView {
    if (!_messageView) {
        _messageView = [[ICMessageView alloc] initWithFrame:CGRectMake(20, 20, 260, self.view.frame.size.height - 100)];
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
