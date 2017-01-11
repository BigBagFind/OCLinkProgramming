//
//  TableContainerView.m
//  TableOCLink
//
//  Created by 吴玉铁 on 2017/1/11.
//  Copyright © 2017年 wuyutie. All rights reserved.
//

#import "TableContainerView.h"

@interface TableContainerView () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, copy) WidthBlock rowWidthBlock;
@property (nonatomic, copy) WidthBlock headerWidthBlock;
@property (nonatomic, copy) WidthBlock footerWidthBlock;




@end


@implementation TableContainerView



- (Width)rowWidth {
    return  ^TableContainerView *(WidthBlock widthBlock) {
        _rowWidthBlock = widthBlock;
        return self;
    };
}

- (Width)headerWidth {
    return  ^TableContainerView *(WidthBlock widthBlock) {
        _headerWidthBlock = widthBlock;
        return self;
    };	
}

- (Width)footerWidth {
    return  ^TableContainerView *(WidthBlock widthBlock) {
        _footerWidthBlock = widthBlock;
        return self;
    };
}



- (void)awakeFromNib {
    [super awakeFromNib];
    [self initViews];
}


- (void)initViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //[self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_rowWidthBlock) {
        return _rowWidthBlock(indexPath);
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_headerWidthBlock) {
        return _headerWidthBlock([NSIndexPath indexPathForRow:0 inSection:section]);
    }
    return 0;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (_footerWidthBlock) {
        return _footerWidthBlock([NSIndexPath indexPathForRow:0 inSection:section]);
    }
    return 0;
}





@end
