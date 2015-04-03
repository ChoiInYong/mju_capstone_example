//
//  PersonDetailViewController.m
//  example_project
//
//  Created by kyungtaek on 2015. 4. 4..
//  Copyright (c) 2015년 BezierPaths. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "Person.h"
#import "NSDate+Support.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController
- (instancetype)initWithPerson:(Person *)person {
    self = [super init];
    if (self) {
        self.person = person;
        [self.navigationItem setTitle:self.person.name];
    }

    return self;
}

+ (instancetype)controllerWithPerson:(Person *)person {
    return [[self alloc] initWithPerson:person];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.nameLabel setText:self.person.name];
    [self.ageLabel setText:[NSString stringWithFormat:@"%ld살", (long) self.person.age]];
    [self.birthdayLabel setText:[self.person.birthDay shortString]];

}


@end
