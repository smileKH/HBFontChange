//
//  HBButtonChangeVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBButtonChangeVC.h"

@interface HBButtonChangeVC ()
@property (nonatomic ,strong)UIButton *button;
@end

@implementation HBButtonChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"button字体改变";
    [self addButtonChangeSubView];
}

-(void)addButtonChangeSubView{

    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 200, 40);
    [self.button setBackgroundColor:[UIColor redColor]];
    [self.button setTitle:@"我是一个button" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    self.button.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    self.button.center = self.view.center;
    [self.view addSubview:self.button];
    
}
-(void)clickButton{

    NSLog(@"欢迎你与我交流！");
}
#pragma mark - 监听到字体改变
-(void)fontSizeChange{
    
    self.button.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    
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
