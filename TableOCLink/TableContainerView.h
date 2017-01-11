//
//  TableContainerView.h
//  TableOCLink
//
//  Created by 吴玉铁 on 2017/1/11.
//  Copyright © 2017年 wuyutie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableContainerView;
typedef CGFloat(^WidthBlock)(NSIndexPath *indexPath);
typedef TableContainerView *(^Width)(WidthBlock widthBlock);

@interface TableContainerView : UIView

@property (nonatomic, copy) Width rowWidth;

@property (nonatomic, copy) Width headerWidth;

@property (nonatomic, copy) Width footerWidth;


@end
