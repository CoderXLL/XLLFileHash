//
//  ViewController.m
//  XLLFileHashDemo
//
//  Created by 肖乐 on 2017/12/23.
//  Copyright © 2017年 IMMoveMobile. All rights reserved.
//

#import "ViewController.h"
#import "XLLFileHash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = @"文件路径";
    NSString *fileHash = [XLLFileHash fileHashWithFilePath:filePath];
    NSLog(@"%@", fileHash);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
