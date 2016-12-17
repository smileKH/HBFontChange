//
//  HBLabelChangeVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBLabelChangeVC.h"

@interface HBLabelChangeVC ()

@property (nonatomic ,strong)UILabel *label;
@end

@implementation HBLabelChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"label字体改变";
    
    [self addLabelChangeSubView];
}
-(void)addLabelChangeSubView{

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.label.backgroundColor = [UIColor redColor];
    self.label.text = @"我是一个label";
    self.label.center = self.view.center;
    self.label.font = Font(USERDEFAULT_float(CONTENT_FONT));
    [self.view addSubview:self.label];

}
#pragma mark - 监听到字体改变
-(void)fontSizeChange{
    
    self.label.font = Font(USERDEFAULT_float(CONTENT_FONT));

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
