//
//  ICInputTextView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/29.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICInputTextView.h"

@implementation ICInputTextView
-(instancetype)init {
    self = [super init];
    if (self) {
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
    }
    return self;
}


#pragma mark - 当文件拖入到view中
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    // 过滤掉非法的数据类型 <-> Filter out illegal data types
    if ([[pboard types] containsObject:NSFilenamesPboardType]) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

#pragma mark - 拖入文件后松开鼠标
- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    
    // Extract the required NSFilenamesPboardType data from the clipboard
    // 从粘贴板中提取需要的NSFilenamesPboardType数据
    NSArray *filePathList = [pboard propertyListForType:NSFilenamesPboardType];
    
    // 将文件数路径组通过代理回调出去
    if(_inDelegate && [_inDelegate respondsToSelector:@selector(dragDropFilePathList:)]) {
        [_inDelegate dragDropFilePathList:filePathList];
    }
    
    return YES;
}

@end
