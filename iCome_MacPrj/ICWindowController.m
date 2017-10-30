//
//  ICWindowController.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICWindowController.h"

@interface ICWindowController ()

@end

@implementation ICWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSLog(@"window");
    // 设置titlebar为透明 <-> Set titlebar as transparent
    self.window.titlebarAppearsTransparent = YES;
    // 隐藏title
    self.window.titleVisibility = NSWindowTitleHidden;
    // 隐藏最大化按钮
//    [self.window standardWindowButton:NSWindowZoomButton].hidden = YES;
}

@end
