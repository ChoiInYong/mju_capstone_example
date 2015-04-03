//
// Created by kyungtaek on 15. 4. 4..
// Copyright (c) 2015 BezierPaths. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, strong) NSDate *birthDay;
@property (nonatomic, strong) UIImage *thumbnailImage;

@end