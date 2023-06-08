//
//  ViewController.m
//  WebViewApp
//
//  Created by 小口 哲史 on 2017/02/15.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
@synthesize wv;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    wv.mediaPlaybackRequiresUserAction = NO;
    wv.scrollView.bounces = false;
    wv.delegate = self;
    NSString *urlString = @"https://fport-app.jp/news/";
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [wv loadRequest:urlRequest];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)webViewDidStartLoad:(UIWebView*)webView {}

-(void)webViewDidFinishLoad:(UIWebView*)webView {}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSString *checkURL = [request.URL absoluteString];
        NSRange linkMatch  = [checkURL rangeOfString:@"http://rmasm.osr2552-jbc.com/dlsite"];
        
        if (linkMatch.location != NSNotFound) {
            [[UIApplication sharedApplication] openURL:request.URL];
            return NO;
        }
    }
    return YES;
}

@end
