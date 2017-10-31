//
//  ICInputView.h
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/30.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ICInputTextView.h"
#import "ICInputMenuView.h"

@interface ICInputView : NSView
@property (nonatomic, strong)ICInputTextView *inputTextView;

@property (nonatomic, strong)ICInputMenuView *menuView;
@end
