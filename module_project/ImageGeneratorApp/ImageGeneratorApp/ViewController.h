//
//  ViewController.h
//  ImageGeneratorApp
//
//  Created by 小口 哲史 on 2017/02/10.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
@interface ViewController : UIViewController {
    View *mView;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)handleGenerateImageBtn:(id)sender;


@end

