//
//  ICMainViewController.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICInputTextView.h"
#import "ICMessageView.h"
#import "ICChatBoxView.h"

@interface ICMainViewController ()<ICInputProtocol>
@property (nonatomic, strong)ICInputTextView *inputTextView;
@end

@implementation ICMainViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSWindow *window = [NSApplication sharedApplication].windows.firstObject;
    CGRect frame = window.frame;
    frame.size.width = 350;
    frame.size.height = 300;

    [window setFrame:frame display:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"主页面");
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    [self.view addSubview:self.inputTextView];
    
    [self.inputTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(150);
    }];
}
#pragma mark ICInputProtocol
- (void)dragDropFilePathList:(NSArray<NSString *> *)filePathList {
    
}

-(ICInputTextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[ICInputTextView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
        _inputTextView.inDelegate = self;
        
        NSScrollView * scrollview = [[NSScrollView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 100)];
        [scrollview setBorderType:NSNoBorder];
        [scrollview setHasVerticalRuler:YES];
        [scrollview setHasHorizontalScroller:YES];
        [scrollview setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [_inputTextView setMinSize:NSMakeSize(0.0, self.view.frame.size.height)];
        [_inputTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [_inputTextView setVerticallyResizable:YES];
        [_inputTextView setHorizontallyResizable:YES];
        [_inputTextView setAutoresizingMask:NSViewWidthSizable];
        [[_inputTextView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [[_inputTextView textContainer] setWidthTracksTextView:YES];
        [_inputTextView setFont:[NSFont fontWithName:@"Helvetica" size:16]];
        
        [scrollview setDocumentView:_inputTextView];
        [self.view addSubview:scrollview];
        
        [scrollview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
            make.height.mas_equalTo(150);
        }];
        
    }
    return _inputTextView;
}

@end
