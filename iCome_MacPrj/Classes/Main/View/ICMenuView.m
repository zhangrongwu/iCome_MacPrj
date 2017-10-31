//
//  ICMenuView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/30.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMenuView.h"
#import "ICLogInViewController.h"

@interface ICMenuView()

@property (nonatomic, strong)NSButton *message;
@property (nonatomic, strong)NSButton *contacts;
@property (nonatomic, strong)NSButton *userInfo;
@property (nonatomic, strong)NSButton *setting;

@end

@implementation ICMenuView
-(instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self addSubview:self.userInfo];
        [self addSubview:self.message];
        [self addSubview:self.contacts];
        [self addSubview:self.setting];
        
        [self.userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(20);
            make.centerX.equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfo.mas_bottom).offset(40);
            make.centerX.equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];

        [self.contacts mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.message.mas_bottom).offset(40);
            make.centerX.equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        
        [self.setting mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-30);
            make.centerX.equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)userInfoAction:(id)sender {
    NSLog(@"userinfo");
}

- (void)messageAction:(id)sender {
    
}

- (void)contactsAction:(id)sender {

}

- (void)settingAction:(id)sender {

//    [self.window orderOut:nil];
}

-(NSButton *)userInfo {
    if (!_userInfo) {
        _userInfo = [[NSButton alloc]initWithFrame:CGRectMake(5,0, 44, 44)];
        //按钮样式
        _userInfo.bezelStyle = NSRecessedBezelStyle;
        //按钮的Type
        [_userInfo setButtonType:NSButtonTypeMomentaryPushIn];
        [_userInfo setTarget:self];
        [_userInfo setAction:@selector(userInfoAction:)];
        //设置图片
        //        _userInfo.image = [NSImage imageNamed:@"close.png"];
        //按钮的标题
        [_userInfo setTitle:@"头像"];
    }
    return _userInfo;
}

-(NSButton *)message {
    if (!_message) {
        _message = [[NSButton alloc]initWithFrame:CGRectMake(5,0, 44, 44)];
        _message.bezelStyle = NSRecessedBezelStyle;
        [_message setButtonType:NSButtonTypeMomentaryPushIn];
        [_message setTarget:self];
        [_message setAction:@selector(messageAction:)];
//        _message.image = [NSImage imageNamed:@"close.png"];
        [_message setTitle:@"消息"];
    }
    return _message;
}

-(NSButton *)contacts {
    if (!_contacts) {
        _contacts = [[NSButton alloc]initWithFrame:CGRectMake(5,0, 44, 44)];
        _contacts.bezelStyle = NSRecessedBezelStyle;
        [_contacts setButtonType:NSButtonTypeMomentaryPushIn];
//        _contacts.image = [NSImage imageNamed:@"Tabbar-Contacts.tiff"];
        [_contacts setTarget:self];
        [_contacts setAction:@selector(contactsAction:)];
//        [_contacts setTitle:@"通讯录"];
    }
    return _contacts;
}

-(NSButton *)setting {
    if (!_setting) {
        _setting = [[NSButton alloc]initWithFrame:CGRectMake(5,0, 44, 44)];
        _setting.bezelStyle = NSRecessedBezelStyle;
        [_setting setButtonType:NSButtonTypeMomentaryPushIn];
        //        _contacts.image = [NSImage imageNamed:@"close.png"];
        [_setting setTarget:self];
        [_setting setAction:@selector(settingAction:)];
        [_setting setTitle:@"设置"];
    }
    return _setting;
}
@end
