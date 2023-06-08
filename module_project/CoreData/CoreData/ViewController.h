//
//  ViewController.h
//  CoreData
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManagedObjectContext.h"
#import "Person.h"
@interface ViewController : UIViewController {
    int count;
}

- (IBAction)handleSaveBtn:(id)sender;
- (IBAction)handleGetBtn:(id)sender;



@end

