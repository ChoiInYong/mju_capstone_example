//
// Created by kyungtaek on 15. 4. 4..
// Copyright (c) 2015 BezierPaths. All rights reserved.
//

#import "PersonManager.h"
#import "Person.h"


@implementation PersonManager {

}
- (void)printPerson:(Person *)person {

    NSLog(@"person.name = %@", person.name);
    NSLog(@"person.age = %u", person.age);
    NSLog(@"person.birthDay = %@", person.birthDay);

}

@end