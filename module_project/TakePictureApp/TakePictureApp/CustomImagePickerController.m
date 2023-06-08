//
//  CustomImagePickerController.m
//  TakePictureApp
//
//  Created by 小口 哲史 on 2017/02/13.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "CustomImagePickerController.h"
@interface CustomImagePickerController ()
@end
@implementation CustomImagePickerController

-(id)initWithDelegate:(id<UIImagePickerControllerDelegate>)delegate {
    self = [super init];
        if (self) {
            mDelegate = delegate;
        }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)configurateWithEnableMovie:(BOOL)enableMovie {
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
        if (enableMovie) {
            self.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        }
    self.videoQuality = UIImagePickerControllerQualityTypeHigh;
    self.delegate = self;
}

-(void)showOverlayView {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self setSourceType:UIImagePickerControllerSourceTypeCamera];
        OverlayView *overlayView = [[OverlayView alloc] initWithFrame:self.view.frame];
        overlayView.cursor.opaque = NO;
        overlayView.cursor.alpha = 0.5;
        self.cameraOverlayView = overlayView;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        if ([mediaType isEqualToString:@"public.image"]){
            UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
            UIImageWriteToSavedPhotosAlbum(picture, nil, nil, nil);
        } else if ([mediaType isEqualToString:@"public.movie"]){
            NSURL *chosenMovie = [info objectForKey:UIImagePickerControllerMediaURL];
            NSURL *fileURL =  [info objectForKey:UIImagePickerControllerMediaURL];;
            NSData *movieData = [NSData dataWithContentsOfURL:chosenMovie];
            [movieData writeToURL:fileURL atomically:YES];
            UISaveVideoAtPathToSavedPhotosAlbum([chosenMovie path], nil, nil, nil);
        }
    [self dismiss:info];
}

-(void)initTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)time:(NSTimer*)timer {
    if (self.cameraCaptureMode == UIImagePickerControllerCameraCaptureModePhoto) {
        NSLog(@"カメラです");
        OverlayView *overlayView = [[OverlayView alloc] initWithFrame:self.view.frame];
        overlayView.cursor.opaque = NO;
        //overlayView.cursor.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
        overlayView.cursor.alpha = 0.5;
        self.cameraOverlayView = overlayView;
    } else if (self.cameraCaptureMode == UIImagePickerControllerCameraCaptureModeVideo) {
        NSLog(@"ビデオです");
        OverlayView_video *overlayView = [[OverlayView_video alloc] initWithFrame:self.view.frame];
        overlayView.cursor.opaque = NO;
        //overlayView.cursor.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
        overlayView.cursor.alpha = 0.5;
        self.cameraOverlayView = overlayView;
    }
}

-(void)dismiss:(NSDictionary*)info {
    NSMutableDictionary *mutableInfo = [info mutableCopy];
        if (mDelegate) {
            [mDelegate imagePickerController:self didFinishPickingMediaWithInfo:mutableInfo];
        }
}


@end
