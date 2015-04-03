//
// Created by kyungtaek on 15. 4. 4..
// Copyright (c) 2015 BezierPaths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Support)

+(NSDate *) createSpecificDateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;

-(NSDate *) toLocalTime;

@end