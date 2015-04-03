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

static NSURLSession *gSession = nil;

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

    if (gSession == nil) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
        gSession = session;
    }

    [self.nameLabel setText:self.person.name];
    [self.ageLabel setText:[NSString stringWithFormat:@"%ld살", (long) self.person.age]];
    [self.birthdayLabel setText:[self.person.birthDay shortString]];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self requestRemoteImageDownload];
}


- (void) requestRemoteImageDownload {

    //URL: https://lh3.googleusercontent.com/-gQk95qA9_tI/AAAAAAAAAAI/AAAAAAAAAAA/ovHoNvPFJfg/photo.jpg

    NSString *imageUrlString = @"https://lh3.googleusercontent.com/-gQk95qA9_tI/AAAAAAAAAAI/AAAAAAAAAAA/ovHoNvPFJfg/photo.jpg";

    //[gSession downloadTaskWithURL:[NSURL URLWithString:imageUrlString] completionHandler:]

    __weak PersonDetailViewController *weakself = self;
    NSURLSessionTask *task = [gSession dataTaskWithURL:[NSURL URLWithString:imageUrlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        UIImage *image = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.thumbnailImageView setImage:image];
        });
    }];

    [task resume];
}


@end
