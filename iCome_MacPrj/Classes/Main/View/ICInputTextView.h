//
//  ICInputTextView.h
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ICInputProtocol.h"
@interface ICInputTextView : NSTextView

@property (nonatomic, weak) id <ICInputProtocol> inDelegate;

@end
