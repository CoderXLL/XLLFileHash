//
//  ViewController.m
//  XLLFileHashTest
//
//  Created by 肖乐 on 2017/12/23.
//  Copyright © 2017年 IMMoveMobile. All rights reserved.
//

#import "ViewController.h"
#import <XLLFileHash/XLLFileHash.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = @"/Users/xiaole/Desktop/5C6B5728F817D8093BA4637AD78BAE94.jpg";
    NSString *fileHash = [XLLFileHash fileHashWithFilePath:filePath];
    NSLog(@"%@", fileHash);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
