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
        [self addSubview:self.inputTextView];
        
        self.menuView.layer.backgroundColor = [NSColor blackColor].CGColor;
        
        [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(MenuHeight);
        }];
        
        [self.inputTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.menuView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(self.frame.size.height - MenuHeight);
        }];
    }
    return self;
}

-(ICInputMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[ICInputMenuView alloc] initWithFrame:CGRectZero];
    }
    return _menuView;
}

-(ICInputTextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[ICInputTextView alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 100)];
        _inputTextView.inDelegate = self;
        
        NSScrollView * scrollview = [[NSScrollView alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 100)];
        [scrollview setBorderType:NSNoBorder];
        [scrollview setHasVerticalRuler:YES];
        [scrollview setHasHorizontalScroller:YES];
        [scrollview setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        
        [_inputTextView setMinSize:NSMakeSize(0.0, self.frame.size.height)];
        [_inputTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [_inputTextView setVerticallyResizable:YES];
        [_inputTextView setHorizontallyResizable:YES];
        [_inputTextView setAutoresizingMask:NSViewWidthSizable];
        [[_inputTextView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [[_inputTextView textContainer] setWidthTracksTextView:YES];
        [_inputTextView setFont:[NSFont fontWithName:@"Helvetica" size:14]];
        
        [scrollview setDocumentView:_inputTextView];
        [self addSubview:scrollview];
        
        [scrollview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.menuView.mas_bottom);
            make.left.equalTo(_inputTextView.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(self.frame.size.height - MenuHeight);
        }];
        
    }
    return _inputTextView;
}


@end
