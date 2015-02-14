//
//  ThirdDetailViewController.m
//  Stevens
//
//  Created by weixiao on 2/10/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import "ThirdDetailViewController.h"

@interface ThirdDetailViewController ()

@end

@implementation ThirdDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.text = _ThirdDetail[2];
    if ([_textView.text isEqualToString:@"0"]) {
        //NSString *default_txt = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bank.rtf"];
        //NSString *base_content=[NSString stringWithContentsOfFile:default_txt encoding:NSUTF8StringEncoding error:nil];
        //_textView.text = base_content;
        NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"fees" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textView.text = str;
        [self.view addSubview:_textView];
    }else if ([_textView.text isEqualToString:@"1"]) {
        NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"selection" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textView.text = str;
        [self.view addSubview:_textView];
    }else if ([_textView.text isEqualToString:@"2"]) {
        NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"eat" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textView.text = str;
        [self.view addSubview:_textView];
    }else if ([_textView.text isEqualToString:@"3"]) {
        NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TeachingAssistant" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textView.text = str;
        [self.view addSubview:_textView];
    }else if ([_textView.text isEqualToString:@"4"]) {
        NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"drive" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
        _textView.text = str;
        [self.view addSubview:_textView];
    }

    // Do any additional setup after loading the view.
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
