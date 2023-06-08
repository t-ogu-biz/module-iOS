//
//  ViewController.m
//  CoreData
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSaveBtn:(id)sender {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[ManagedObjectContext sharedInstance]];
    [fetchRequest setEntity:entityDes];
    NSString *name = @"A";
    count ++;
    NSString *age = [NSString stringWithFormat:@"%i",count];
    NSMutableArray *predicateArray = [[NSMutableArray alloc] init];
    [predicateArray addObject:[NSPredicate predicateWithFormat:@"name = %@", name]];
    [predicateArray addObject:[NSPredicate predicateWithFormat:@"age = %@", age]];
    [fetchRequest setPredicate:[NSCompoundPredicate andPredicateWithSubpredicates:predicateArray]];
    NSError *error = nil;
    NSArray *result = [[ManagedObjectContext sharedInstance] executeFetchRequest:fetchRequest error:&error];
        if(nil != error){
            NSLog(@"SampleEntityDAO#setSampleEntityList error %@, %@", error, [error userInfo]);
        }
    NSInteger resultCnt = [result count];
        if(0 == resultCnt){
            Person *item = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[ManagedObjectContext sharedInstance]];
            item.name = name;
            item.age = age;
        } else {
            Person *item = [result objectAtIndex:0];
            item.name = name;
            item.age = age;
    }
    BOOL ret = [[ManagedObjectContext sharedInstance] save:nil];
        if(!ret){
            NSLog(@"SampleEntityDAO#setSampleEntityList error %@, %@", error, [error userInfo]);
        }
}

- (IBAction)handleGetBtn:(id)sender {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDes;
    entityDes = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[ManagedObjectContext sharedInstance]];
    [fetchRequest setEntity:entityDes];
    NSSortDescriptor *sortDes = [[NSSortDescriptor alloc]initWithKey:@"age" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDes, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSError *error = nil;
    NSArray *itemList = [[ManagedObjectContext sharedInstance] executeFetchRequest:fetchRequest error:&error];
        if(nil != error){
            NSLog(@"SampleEntityDAO#getSampleEntityItemList error %@, %@", error, [error userInfo]);
        }
        for (Person *person in itemList) {
            NSLog (@"name:%@、age:%@",person.name,person.age);
        }
}


@end
