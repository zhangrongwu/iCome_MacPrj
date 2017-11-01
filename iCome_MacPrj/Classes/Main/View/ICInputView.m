//
//  ICInputView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/30.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICInputView.h"
#define MenuHeight  50
@interface ICInputView()<ICInputProtocol>

@end

@implementation ICInputView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(instancetype)initWithFrame:(NSRect)frameRect
{
    if (self = [super initWithFrame:frameRect]) {
        [self addSubview:self.menuView];
        
        self.menuView.layer.backgroundColor = [NSColor blackColor].CGColor;
        
        [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(MenuHeight);
        }];
        
        NSScrollView * scrollView = [[NSScrollView alloc] init];
        [scrollView setBorderType:NSNoBorder];
        scrollView.hasVerticalScroller  = YES;
        // 1.2.设置frame并自动布局
        scrollView.frame   = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - MenuHeight);
        scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        [self addSubview:scrollView];
        
        _inputTextView = [[ICInputTextView alloc] init];
        _inputTextView.frame = scrollView.bounds;
        _inputTextView.inDelegate = self;
        
        [_inputTextView setMinSize:NSMakeSize(0.0, self.frame.size.height)];
        [_inputTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [_inputTextView setVerticallyResizable:YES];
        [_inputTextView setHorizontallyResizable:YES];
        [_inputTextView setAutoresizingMask:NSViewWidthSizable];
        [[_inputTextView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [[_inputTextView textContainer] setWidthTracksTextView:YES];
        [_inputTextView setFont:[NSFont fontWithName:@"Helvetica" size:14]];
        
        scrollView.contentView.documentView = _inputTextView;
        
    }
    return self;
}


#pragma mark ICInputProtocol
- (void)dragDropFilePathList:(NSArray<NSString *> *)filePathList {
    
}

-(ICInputMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[ICInputMenuView alloc] initWithFrame:CGRectZero];
    }
    return _menuView;
}

@end
