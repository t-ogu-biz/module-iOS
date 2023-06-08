//
//  ShowPopup.h
//  PopupSample
//
//  Created by nagasaka.satoshi on 13/02/07.
//  Copyright (c) 2013年 Microwave Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PopupBackground.h"
@protocol ShowPopupDelegate <NSObject>
// ポップアップを閉じる前に呼ばれる
-(void)willDismissPopup;
@end
@interface ShowPopup : NSObject {
    UIView *topView;
}
@property(nonatomic)BOOL closeBtnEnabled;
@property (nonatomic) UIViewController *popupViewController;
@property(nonatomic, retain) NSString *popupType;
@property(nonatomic,weak)id<ShowPopupDelegate> delegate;
-(id)initWithBaseViewController:(UIViewController*)baseViewController;
-(void)showPopup:(UIViewController*)popup;
-(void)dismissPopup;
-(void)dismissPopupViewControllerWithanimation:(id)sender;
-(void)dismissPopupBeforeShowFilterTop;
-(void)fadeViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView dismissInterval:(NSTimeInterval)dismissInterval;
@end
