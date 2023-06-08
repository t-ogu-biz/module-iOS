//
//  MWProgressHUD.m
//  ShowLabelSample
//
//  Created by 小口 哲史 on 13/04/08.
//  Copyright © 2013年 小口 哲史. All rights reserved.
//

#import "MWDialogHUD.h"
#import "UIColor+Hex.h"

@implementation MWDialogHUD

#define PROGRESS_DIALOG_HEIGHT 40


-(id)initWithAnchorView:(UIView *)anchorView{
    self = [super init];
    if (self) {
        _anchorView = anchorView;
    }
    return self;
}

-(void)dealloc{
    
    _anchorView = nil;
}

-(void)showProgress:(NSString *)text withIndicator:(ProgressDialogStatus)status {
    if (_hud) {
        [self removeResultLabel];
    }

    [self changeDialogWithText:text andIndicator:status];

    [_anchorView addSubview:_hud];
    
	[UIView beginAnimations: nil context: nil];
	[UIView setAnimationDuration:1.0f];
	CGRect frame = _hud.frame;
	frame.origin.y = frame.origin.y + PROGRESS_DIALOG_HEIGHT;
	_hud.frame = frame;
	[UIView commitAnimations];
    
}

//▼上部に表示するアラートを閉じるメソッド
-(void)dismiss{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0f];
	CGRect frame = _hud.frame;
	frame.origin.y = frame.origin.y - PROGRESS_DIALOG_HEIGHT;
	_hud.frame = frame;
	[UIView setAnimationDidStopSelector:@selector(removeResultLabel)];
	[UIView commitAnimations];
}

-(void)dismissWithTimeInterval:(float)interval{
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:interval];
}


- (void)removeResultLabel {
    [indicator removeFromSuperview];
    [_label removeFromSuperview];
    [_hud removeFromSuperview];
    indicator = nil;
    _label = nil;
    _hud = nil;
}

-(void)changeDialogWithText:(NSString*)text andIndicator:(ProgressDialogStatus)status{
    _text = text;
    _status = status;
    if (!_hud) {
        _hud = [[UIView alloc] initWithFrame:CGRectMake(0, -PROGRESS_DIALOG_HEIGHT, 320, PROGRESS_DIALOG_HEIGHT)];
    }
    
    _hud.backgroundColor = [UIColor hexToUIColor:@"B9300A" alpha:0.8f];
    
    UIFont *font = [UIFont systemFontOfSize:14.0];
    if (_label) {
        [_label removeFromSuperview];
        _label = nil;
    }
    
    _label = [self formattingText:text andFont:font];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor clearColor];
    _label.textAlignment = NSTextAlignmentCenter;
    CGPoint point = CGPointMake(_hud.frame.size.width /2, _hud.frame.size.height/2);
    _label.center = point;
    
    [_hud addSubview:_label];
    
    if (indicator) {
        [indicator removeFromSuperview];
        indicator = nil;
    }
    indicator = [self createIndicator:status];
    indicator.center = CGPointMake(_label.center.x - _label.frame.size.width/2  - 25, _hud.frame.size.height/2);
    [_hud addSubview:indicator];
}

-(UIView*)createIndicator:(ProgressDialogStatus)status{
    UIView *indicatorView;
    switch (status) {
        case PROGRESS_DIALOG_STATUS_NORMAL:
            indicatorView = [[UIActivityIndicatorView alloc] init];
            [((UIActivityIndicatorView*)indicatorView) startAnimating];
            break;
        case PROGRESS_DIALOG_STATUS_FINISH_SUCCESSFUL:
            indicatorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
            indicatorView.frame = CGRectMake(0, 0, 30, 30);
            break;
        case PROGRESS_DIALOG_STATUS_ERROR_OCCURED:
            break;
        default:
            break;
    }
    return indicatorView;
}

-(UILabel*)formattingText:(NSString *)text andFont:(UIFont *)font {
    /*ライブラリ化対応
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width/2, PROGRESS_DIALOG_HEIGHT)
                       lineBreakMode:NSLineBreakByTruncatingHead];
    */
    CGSize size = [text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width/2,PROGRESS_DIALOG_HEIGHT)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName:font}
                                                              context:nil].size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [label setNumberOfLines:0];
    [label setFont:font];
    [label setText:text];
    return label;
}

@end
