//
//  PersonDetailViewController.h
//  example_project
//
//  Created by kyungtaek on 2015. 4. 4..
//  Copyright (c) 2015년 BezierPaths. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface PersonDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *ageLabel;
@property (nonatomic, strong) IBOutlet UILabel *birthdayLabel;

@property (nonatomic, strong) Person *person;

- (instancetype)initWithPerson:(Person *)person;
+ (instancetype)controllerWithPerson:(Person *)person;

@end
