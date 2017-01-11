//
//  ViewController.m
//  TableOCLink
//
//  Created by 吴玉铁 on 2017/1/11.
//  Copyright © 2017年 wuyutie. All rights reserved.
//

#import "ViewController.h"
#import "TableContainerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TableContainerView *view = TableContainerView.table().rowWidth(^CGFloat (NSIndexPath *indexPath) {
        if (indexPath.row %2 == 0) {
            return 44;
        }
        return 22;
    }).headerWidth(^CGFloat (NSIndexPath *indexPath) {
        if (indexPath.section %2 == 0) {
            return 44;
        }
        return 44;
    }).headerWidth(^CGFloat (NSIndexPath *indexPath) {
        return 44;
    });
    
    
    [self.view addSubview:view];
    
    
   
        
   
    
}





@end
