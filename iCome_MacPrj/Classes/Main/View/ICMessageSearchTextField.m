//
//  ICMessageSearchTextField.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/11/1.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMessageSearchTextField.h"

@implementation ICMessageSearchTextField
-(void)awakeFromNib {
    [[self cell] setBezelStyle:NSTextFieldRoundedBezel];
}
- (void)drawRect:(NSRect)dirtyRect
{
    
    NSRect blackOutlineFrame = NSMakeRect(0.0, 0.0, [self bounds].size.width, [self bounds].size.height-1.0);
    NSGradient *gradient = nil;
    if ([NSApp isActive]) {
        gradient = [[NSGradient alloc] initWithStartingColor:[NSColor whiteColor] endingColor:[NSColor whiteColor]];
    }
    else {
        gradient = [[NSGradient alloc] initWithStartingColor:[NSColor whiteColor] endingColor:[NSColor whiteColor]];
    }
    
    [gradient drawInBezierPath:[NSBezierPath bezierPathWithRoundedRect:blackOutlineFrame xRadius:4 yRadius:4] angle:40];
    
}



@end
