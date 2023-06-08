//
//  ViewController.h
//  TakePictureApp
//
//  Created by 小口 哲史 on 2017/02/13.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayView.h"
#import "OverlayView_video.h"
#import "CustomImagePickerController.h"
@interface ViewController : UIViewController<UIImagePickerControllerDelegate> {
    NSTimer *timer;
    CustomImagePickerController *ipc;
}

- (IBAction)handleTalePictureBtn:(id)sender;

@end

