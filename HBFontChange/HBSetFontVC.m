//
//  HBSetFontVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBSetFontVC.h"
static float   changeFont  = 2;
@interface HBSetFontVC ()

@property (nonatomic ,strong)UIButton *addButton;
@property (nonatomic ,strong)UIButton *reduceButton;

@end

@implementation HBSetFontVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字体设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加按钮
    [self addSetButton];
}
-(void)addSetButton{

    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.frame = CGRectMake(40, 100, self.view.frame.size.width-80, 40);
    [self.addButton setTitle:@"字体变大" forState:UIControlStateNormal];
    [self.addButton setBackgroundColor:[UIColor redColor]];
    self.addButton.tag = 1;
    self.addButton.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    [self.addButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    
    
    self.reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reduceButton.frame = CGRectMake(40, 200, self.view.frame.size.width-80, 40);
    [self.reduceButton setTitle:@"字体变小" forState:UIControlStateNormal];
    [self.reduceButton setBackgroundColor:[UIColor redColor]];
    self.reduceButton.tag = 2;
    self.reduceButton.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    [self.reduceButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.reduceButton];
}

-(void)clickButton:(UIButton *)button{

    float titleFont = USERDEFAULT_float(TITLE_FONT);
    float contentFont = USERDEFAULT_float(CONTENT_FONT);
    float detailsFont = USERDEFAULT_float(DETAILS_FONT);
    
    if (button.tag==1) {
        titleFont +=changeFont;
        contentFont +=changeFont;
        detailsFont +=changeFont;
    }
    else{
        titleFont -=changeFont;
        contentFont -=changeFont;
        detailsFont -=changeFont;
    
    }
    //保存
    NSUserDefaults *fontDefaults = [NSUserDefaults standardUserDefaults];
    //把所用的字体值保存下来
    [fontDefaults setFloat:titleFont forKey:TITLE_FONT];
    [fontDefaults setFloat:contentFont forKey:CONTENT_FONT];
    [fontDefaults setFloat:detailsFont forKey:DETAILS_FONT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //发通知
    //发通知
    [[NSNotificationCenter defaultCenter]postNotificationName:ALL_FONT_CHANGE object:nil];
    
}

#pragma mark - 监听到字体改变
-(void)fontSizeChange{
   
    self.addButton.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    self.reduceButton.titleLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));

    
    
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
