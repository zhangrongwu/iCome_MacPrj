//
//  ICLoginViewController.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/31.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICLoginViewController.h"

@interface ICLoginViewController ()

@end

@implementation ICLoginViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSWindow *window = [NSApplication sharedApplication].windows.firstObject;
    CGRect frame = window.frame;
    frame.size.width = 100;
    frame.size.height = 150;
    
    [window setFrame:frame display:YES];
    
    [window setMinSize:NSMakeSize(300, 400)];
    [window setMaxSize:NSMakeSize(300, 400)];
    
    [window standardWindowButton:NSWindowZoomButton].hidden = YES;
    [window standardWindowButton:NSWindowMiniaturizeButton].hidden = YES;
    
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
