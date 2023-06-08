//
//  ViewController.h
//  WebViewApp
//
//  Created by 小口 哲史 on 2017/02/15.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UITextFieldDelegate, UIWebViewDelegate>{}

@property (weak, nonatomic) IBOutlet UIWebView *wv;

@end

