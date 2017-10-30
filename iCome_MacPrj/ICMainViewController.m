//
//  ICMainViewController.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMainViewController.h"

@interface ICMainViewController ()

@end

@implementation ICMainViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSWindow *window = [NSApplication sharedApplication].windows.firstObject;
    CGRect frame = window.frame;
    frame.size.width = 350;
    [window setFrame:frame display:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"主页面");
    
    
}

@end
