//
//  MWProgressHUD.h
//  ShowLabelSample
//
//  Created by 小口 哲史 on 13/04/08.
//  Copyright © 2013年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    PROGRESS_DIALOG_STATUS_FINISH_SUCCESSFUL = 0,
    PROGRESS_DIALOG_STATUS_ERROR_OCCURED = 1,
    PROGRESS_DIALOG_STATUS_NORMAL = 2,
}ProgressDialogStatus;

//上部からニュルっと表示するダイアログを表現(連絡詳細の新着表示 等)
@interface MWDialogHUD : NSObject{
    UIView *_hud;
    UILabel *_label;
    UIView *indicator;
    
    ProgressDialogStatus _status;
    NSString* _text;
    UIView *_anchorView;
}

-(id)initWithAnchorView:(UIView*)anchorView;
-(void)showProgress:(NSString*)text withIndicator:(ProgressDialogStatus)status;
-(void)dismiss;
-(void)dismissWithTimeInterval:(float)interval;
-(void)changeDialogWithText:(NSString*)text andIndicator:(ProgressDialogStatus)status;

@end
