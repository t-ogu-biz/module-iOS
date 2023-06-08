//
//  ViewController.m
//  TakePictureApp
//
//  Created by 小口 哲史 on 2017/02/13.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)handleTalePictureBtn:(id)sender {
    ipc = [[CustomImagePickerController alloc] initWithDelegate:self];
    [ipc configurateWithEnableMovie:YES];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
            OverlayView *overlayView = [[OverlayView alloc] initWithFrame:ipc.view.frame];
            overlayView.cursor.opaque = NO;
            overlayView.cursor.alpha = 0.5;
            ipc.cameraOverlayView = overlayView;
        }
    [self presentViewController:ipc animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"%s",__FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)initTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(time:)
                                            userInfo:nil
                                            repeats:YES];
}

-(void)time:(NSTimer*)timer {
    if (ipc.cameraCaptureMode == UIImagePickerControllerCameraCaptureModePhoto) {
        NSLog(@"カメラです");
        OverlayView *overlayView = [[OverlayView alloc] initWithFrame:ipc.view.frame];
        overlayView.cursor.opaque = NO;
        overlayView.cursor.alpha = 0.5;
        ipc.cameraOverlayView = overlayView;
    } else if (ipc.cameraCaptureMode == UIImagePickerControllerCameraCaptureModeVideo) {
         NSLog(@"ビデオです");
        OverlayView_video *overlayView = [[OverlayView_video alloc] initWithFrame:ipc.view.frame];
        overlayView.cursor.opaque = NO;
        overlayView.cursor.alpha = 0.5;
        ipc.cameraOverlayView = overlayView;
    }
}

@end
