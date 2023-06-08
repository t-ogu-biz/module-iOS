//
//  ViewController.h
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+autoCustom.h"
#import "UIDevice+Model.h"
#import "SizeManager.h"
//BASE_SCREEN_SIZEは対応端末の中で最小サイズのものを指定
#define BASE_SCREEN_SIZE @"4.0"
#define BASE_SCREEN_SIZE_AREA 181760
/*SIZE
◼︎iPHone5
 inch: 4.0
 area: 320x568=181760
 
 ◼︎iPHone6、iPhone7
 inch: 4.7
 area: 375x667=250125
 
 ◼︎iPHone6Plus、iPhone7Plus
 inch: 5.5
 area: 414x736=304704
 */
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

