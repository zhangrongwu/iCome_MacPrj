//
//  ICMessageTableHeaderView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/11/1.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMessageTableHeaderView.h"
@interface ICMessageTableHeaderView()<NSSearchFieldDelegate>

@end
@implementation ICMessageTableHeaderView

-(instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self addSubview:self.searchView];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)searchFieldDidStartSearching:(NSSearchField *)sender {
    
}
- (void)searchFieldDidEndSearching:(NSSearchField *)sender {
    
}

-(ICMessageSearchTextField *)searchView {
    if (!_searchView) {
        _searchView = [[ICMessageSearchTextField alloc] initWithFrame:CGRectMake(13, 9, self.bounds.size.width - 60, self.bounds.size.height - 18)];
        _searchView.placeholderString = @"搜索";
        _searchView.delegate = self;
        _searchView.textColor = [NSColor lightGrayColor];
    }
    return _searchView;
}


@end
