//
//  HBClassVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBClassVC.h"

@interface HBClassVC ()

@end

@implementation HBClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fontSizeChange) name:ALL_FONT_CHANGE object:nil];
}
-(void)fontSizeChange{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
