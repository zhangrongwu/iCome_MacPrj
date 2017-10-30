//
//  ICInputProtocol.h
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICInputProtocol <NSObject>
- (void)dragDropFilePathList:(NSArray<NSString *> *)filePathList;

@end
