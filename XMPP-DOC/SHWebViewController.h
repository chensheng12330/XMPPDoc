//
//  SHWebView.h
//  GifPlay4Badminton
//
//  Created by sherwin on 15-1-23.
//  Copyright (c) 2015年 sherwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *gifImagePath;

- (IBAction)onTap:(UITapGestureRecognizer *)sender;

@end
