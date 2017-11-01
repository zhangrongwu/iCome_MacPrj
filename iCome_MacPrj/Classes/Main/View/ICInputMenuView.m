//
//  ICInputMenuView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/30.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICInputMenuView.h"

@interface ICInputMenuView()

@property (nonatomic, strong)NSButton *faceButton;
@property (nonatomic, strong)NSButton *cutButton;
@property (nonatomic, strong)NSButton *fileButton;

@end
@implementation ICInputMenuView

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self addSubview:self.faceButton];
        [self addSubview:self.cutButton];
        [self addSubview:self.fileButton];
        
        [self.faceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [self.cutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.faceButton.mas_right).offset(15);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];

        [self.fileButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cutButton.mas_right).offset(15);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


- (void)faceAction:(id)sender {
    
    //    [self.window orderOut:nil];
}

- (void)cutButtonAction:(id)sender {
    
    //    [self.window orderOut:nil];
}

- (void)fileAction:(id)sender {
    [[NSOpenPanel openPanel] runModal];
        //    [self.window orderOut:nil];
}

-(NSButton *)faceButton {
    if (!_faceButton) {
        _faceButton = [[NSButton alloc]initWithFrame:CGRectZero];
        _faceButton.bezelStyle = NSRecessedBezelStyle;
        [_faceButton setButtonType:NSButtonTypeMomentaryPushIn];
        //        _contacts.image = [NSImage imageNamed:@"close.png"];
        [_faceButton setTarget:self];
        [_faceButton setAction:@selector(faceAction:)];
        [_faceButton setTitle:@"表情"];
    }
    return _faceButton;
}


-(NSButton *)cutButton {
    if (!_cutButton) {
        _cutButton = [[NSButton alloc]initWithFrame:CGRectZero];
        _cutButton.bezelStyle = NSRecessedBezelStyle;
        [_cutButton setButtonType:NSButtonTypeMomentaryPushIn];
        //        _contacts.image = [NSImage imageNamed:@"close.png"];
        [_cutButton setTarget:self];
        [_cutButton setAction:@selector(cutButtonAction:)];
        [_cutButton setTitle:@"剪切"];
    }
    return _cutButton;
}

-(NSButton *)fileButton {
    if (!_fileButton) {
        _fileButton = [[NSButton alloc]initWithFrame:CGRectZero];
        _fileButton.bezelStyle = NSRecessedBezelStyle;
        [_fileButton setButtonType:NSButtonTypeMomentaryPushIn];
        //        _contacts.image = [NSImage imageNamed:@"close.png"];
        [_fileButton setTarget:self];
        [_fileButton setAction:@selector(fileAction:)];
        [_fileButton setTitle:@"文件"];
    }
    return _fileButton;
}

@end
