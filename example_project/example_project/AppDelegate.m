//
//  AppDelegate.m
//  example_project
//
//  Created by kyungtaek on 2015. 4. 4..
//  Copyright (c) 2015년 BezierPaths. All rights reserved.
//

#import "AppDelegate.h"
#import "PersonManager.h"
#import "Person.h"
#import "NSDate+Support.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    PersonManager *personManager = [[PersonManager alloc] init];

    Person *person1 = [Person new];
    person1.name = @"Kyungtaek, Lim";
    person1.age = 35;
    person1.birthDay = [NSDate createSpecificDateWithYear:1981 month:8 day:13];

    Person *person2 = [Person new];
    person2.name = @"Hannah, Kim";
    person2.age = 35;
    person2.birthDay = [NSDate createSpecificDateWithYear:1981 month:5 day:22];

    NSArray *family = @[person1, person2];

    for (NSUInteger i = 0; i < [family count]; i++) {
        Person *person = family[i];
        [personManager printPerson:person];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
