//
//  ShowPopup.m
//  PopupSample
//
//  Created by nagasaka.satoshi on 13/02/07.
//  Copyright (c) 2013年 Microwave Inc. All rights reserved.
//
#import "ShowPopup.h"
#import "PopupBackground.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#define kMJSourceViewTag 23941
#define kMJPopupViewTag 23942
#define kMJBackgroundViewTag 23943
#define kMJOverlayViewTag 23945
#define kPopupModalAnimationDuration 0.35
#define nonIntaraction 0.0
#define POPUP_TYPE_A @"popupTypeA"
#define POPUP_TYPE_B @"popupTypeB"
@implementation ShowPopup
@synthesize popupViewController,closeBtnEnabled,delegate,popupType;

-(id)initWithBaseViewController:(UIViewController*)baseViewController {
    self = [super init];
    if(self){
        UIViewController *recentView = baseViewController;
            while(recentView.parentViewController != nil) {
                recentView = recentView.parentViewController;
            }
        topView = recentView.view;
    }
    return self;
}

-(void)showPopup:(UIViewController *)popup {
    self.popupViewController = popup;
    self.delegate = (id<ShowPopupDelegate>)self.popupViewController;
    [self show:popupViewController.view];
}

-(void)show:(UIView*)popupView {
    UIView *sourceView = topView;
    sourceView.tag = kMJSourceViewTag;
    popupView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    popupView.tag = kMJPopupViewTag;
    
        //check if source view controller is not in destination
        if ([sourceView.subviews containsObject:popupView]) return;
    
    //customize popupView
    popupView.layer.shadowPath = [UIBezierPath bezierPathWithRect:popupView.bounds].CGPath;
    popupView.layer.masksToBounds = NO;
    popupView.layer.shadowOffset = CGSizeMake(5, 5);
    popupView.layer.shadowRadius = 5;
    popupView.layer.shadowOpacity = 0.5;
    
    //Add semi overlay
    UIView *overlayView = [[UIView alloc] initWithFrame:sourceView.bounds];
    overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    overlayView.tag = kMJOverlayViewTag;
    overlayView.backgroundColor = [UIColor clearColor];
    
    // BackgroundView
    PopupBackground *backgroundView = [[PopupBackground alloc] initWithFrame:sourceView.bounds];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    backgroundView.tag = kMJBackgroundViewTag;
    backgroundView.backgroundColor = [UIColor clearColor];
    backgroundView.alpha = 0.0f;
    [overlayView addSubview:backgroundView];
    
    //    Make the Background Clickable
    //    UIButton * dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    dismissButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    dismissButton.backgroundColor = [UIColor clearColor];
    //    dismissButton.frame = sourceView.bounds;
    //    [overlayView addSubview:dismissButton];
    //[dismissButton addTarget:self action:@selector(dismissPopupViewControllerWithanimation:) forControlEvents:UIControlEventTouchUpInside];
    
    popupView.alpha = 0.0f;
    [overlayView addSubview:popupView];
    [sourceView addSubview:overlayView];
        if (closeBtnEnabled) {
            // 閉じるボタンを置く
            UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            [closeBtn setImage:[UIImage imageNamed:@"common_batsubutton"] forState:UIControlStateNormal];
            float closeBtnX = overlayView.center.x + (popupView.frame.size.width/2);
            //float closeBtnY = overlayView.center.y - (popupView.frame.size.height/2);
            float closeBtnY = overlayView.center.y - [self getCloseBtnOriginYWithType:popupType Withpopup:popupView];
            closeBtn.center = CGPointMake(closeBtnX,closeBtnY);
            [closeBtn addTarget:self action:@selector(closeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [overlayView addSubview:closeBtn];
        }
    [self fadeViewIn:popupView sourceView:sourceView overlayView:overlayView];
}

-(void)dismissPopup {
    [self dismissPopupViewController:kPopupModalAnimationDuration];
}

-(void)closeBtnClicked:(id)sender {
    [self dismissPopup];
}

- (void)dismissPopupViewControllerWithanimation:(id)sender {
    [self dismissPopupViewController:kPopupModalAnimationDuration];
}

-(void)dismissPopupBeforeShowFilterTop {
    [self dismissPopupViewController:nonIntaraction];
}

- (void)dismissPopupViewController:(NSTimeInterval)dismissInterval {
        if (delegate && [delegate respondsToSelector:@selector(willDismissPopup)]) {
            [delegate willDismissPopup];
        }
    UIView *sourceView = topView;
    UIView *popupView = [sourceView viewWithTag:kMJPopupViewTag];
    UIView *overlayView = [sourceView viewWithTag:kMJOverlayViewTag];
    [self fadeViewOut:popupView sourceView:sourceView overlayView:overlayView dismissInterval:dismissInterval];
    self.popupViewController = nil;
}


#pragma mark --- Fade

- (void)fadeViewIn:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView {
    UIView *backgroundView = [overlayView viewWithTag:kMJBackgroundViewTag];
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                         (sourceSize.height - popupSize.height) / [self getPopupOriginYWithType:popupType],
                                         popupSize.width,
                                         popupSize.height);
    popupView.frame = popupEndRect;
    popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        [self.popupViewController viewWillAppear:NO];
        backgroundView.alpha = 0.5f;
        popupView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self.popupViewController viewDidAppear:NO];
    }];
}

-(float)getCloseBtnOriginYWithType:(NSString *)type Withpopup:(UIView *)popup {
    float originY;
        if ([type isEqualToString:POPUP_TYPE_A]) {
            originY = 190.0;
        } else if ([type isEqualToString:POPUP_TYPE_B]) {
            originY = 181.0;
        } else {
            originY = popup.frame.size.height/2;
        }
    return originY;
}

-(float)getPopupOriginYWithType:(NSString *)type {
    float originY;
        if ([type isEqualToString:POPUP_TYPE_A] || [type isEqualToString:POPUP_TYPE_B]) {
            originY = 4.0;
       } else {
            originY = 2.0;
        }
    return originY;
}



-(void)fadeViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView dismissInterval:(NSTimeInterval)dismissInterval {
    UIView *backgroundView = [overlayView viewWithTag:kMJBackgroundViewTag];
    [UIView animateWithDuration:dismissInterval animations:^{
        [self.popupViewController viewWillDisappear:NO];
        backgroundView.alpha = 0.0f;
        popupView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [popupView removeFromSuperview];
        [overlayView removeFromSuperview];
        [self.popupViewController viewDidDisappear:NO];
        self.popupViewController = nil;
    }];
}

@end


