//
//  AppDelegate.h
//  XLLFileHashTest
//
//  Created by 肖乐 on 2017/12/23.
//  Copyright © 2017年 IMMoveMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

