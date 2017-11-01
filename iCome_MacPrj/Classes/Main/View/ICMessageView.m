//
//  ICMessageView.m
//  iCome_MacPrj
//
//  Created by zhangrongwu on 2017/10/30.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ICMessageView.h"
#import "ICMessageTableHeaderView.h"

@interface ICMessageView()<NSTabViewDelegate, NSTableViewDataSource>

@property (nonatomic, strong)ICMessageTableHeaderView *tableHeaderView;

@end

@implementation ICMessageView

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        
        // 1.0.创建卷轴视图
        NSScrollView *scrollView    = [[NSScrollView alloc] init];
        // 1.1.有(显示)垂直滚动条
        scrollView.hasVerticalScroller  = YES;
        // 1.2.设置frame并自动布局
        scrollView.frame            = self.bounds;
        scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        // 1.3.添加到self.view
        [self addSubview:scrollView];
        
        // 2.0.创建表视图
        NSTableView *tableView      = [[NSTableView alloc] init];
        tableView.frame             = self.bounds;
        // 2.1.设置代理和数据源
        tableView.delegate          = self;
        tableView.dataSource        = self;
        [tableView setHeaderView:[[NSTableHeaderView alloc] initWithFrame:CGRectZero]];
        // 2.2.设置为ScrollView的documentView
        scrollView.contentView.documentView = tableView;
        
        // 3.0.创建表列
        NSTableColumn *columen1     = [[NSTableColumn alloc] initWithIdentifier:@"columen1"];
        // 3.1.设置最小的宽度
//        columen1.minWidth           = self.bounds.size.width;
//        columen1.maxWidth           = self.bounds.size.width;
        // cell 左右滑动问题 左右移动的原因，无非就是tableviewcell的宽度超过了tableview的宽度，或者是tableview的contentsize大于了tableview的宽度，检查一下。。。
        columen1.width = self.bounds.size.width-3;
        columen1.title = @"";
        // 3.2.允许用户调整宽度
        columen1.resizingMask       = NSTableColumnNoResizing;
        // 3.3.添加到表视图
        [tableView addTableColumn:columen1];
        
        // 4.0.同理，表列都是这么创建的
//        NSTableColumn *columen2     = [[NSTableColumn alloc] initWithIdentifier:@"columen2"];
//        columen2.minWidth           = 150.0;
//        columen2.resizingMask       = NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask;
        /*
         NSTableColumnNoResizing        不能改变宽度
         NSTableColumnAutoresizingMask  拉大拉小窗口时会自动布局
         NSTableColumnUserResizingMask  允许用户调整宽度
         */
//        [tableView addTableColumn:columen2];
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 40;
}

// 设置Cell
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    // 1.0.创建一个Cell
    NSTextField *view   = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 100, 30)];
    view.bordered       = NO;
    view.editable       = NO;
    
    // 1.1.判断是哪一列
    if ([tableColumn.identifier isEqualToString:@"columen1"]) {
        view.stringValue    = [NSString stringWithFormat:@"第1列的第%ld个CellCellCellCellCellCellCellCellCellCellCell",row + 1];
    }
    
//    else if ([tableColumn.identifier isEqualToString:@"columen2"]) {
//        view.stringValue    = [NSString stringWithFormat:@"第2列的第%ld个Cell",row + 1];
//    }else {
//        view.stringValue    = [NSString stringWithFormat:@"不知道哪列的第%ld个Cell",row + 1];
//    }
    return view;
}

// 设置行高
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 45;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    return nil;
}

-(ICMessageTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[ICMessageTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    }
    return _tableHeaderView;
}

@end
