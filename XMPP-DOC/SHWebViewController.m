//
//  SHWebView.m
//  GifPlay4Badminton
//
//  Created by sherwin on 15-1-23.
//  Copyright (c) 2015年 sherwin. All rights reserved.
//

#import "SHWebViewController.h"

@implementation SHWebViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    //self.title = @"动画图解";
    
    //[[NSBundle mainBundle] pathForResource:@"guzhang" ofType:@"gif"]
    
    NSData *gif = [NSData dataWithContentsOfFile:self.gifImagePath];
    // view生成
    
    [self.webView loadData:gif MIMEType:@"text/html" textEncodingName:nil baseURL:nil];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    
}
@end
