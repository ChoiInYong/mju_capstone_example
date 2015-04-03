//
//  RootViewController.m
//  example_project
//
//  Created by kyungtaek on 2015. 4. 4..
//  Copyright (c) 2015년 BezierPaths. All rights reserved.
//

#import "RootViewController.h"
#import "PersonManager.h"
#import "Person.h"
#import "NSDate+Support.h"
#import "PersonDetailViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) PersonManager *personManager;
@property (nonatomic, strong) NSMutableArray *family;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:@"Family list"];

    PersonManager *personManager = [[PersonManager alloc] init];

    Person *person1 = [Person new];
    person1.name = @"Kyungtaek, Lim";
    person1.age = 35;
    person1.birthDay = [NSDate createSpecificDateWithYear:1981 month:8 day:13];

    Person *person2 = [Person new];
    person2.name = @"Hannah, Kim";
    person2.age = 35;
    person2.birthDay = [NSDate createSpecificDateWithYear:1981 month:5 day:22];

    NSMutableArray *family = [NSMutableArray arrayWithObjects:person1, person2, nil];

    Person *person3 = [Person new];
    person3.name = @"Hajoon, Lim";
    person3.age = 2;
    person3.birthDay = [NSDate createSpecificDateWithYear:2014 month:4 day:21];
    [family addObject:person3];

    [self setPersonManager:personManager];
    self.family = family;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    for (NSUInteger i = 0; i < [self.family count]; i++) {
        Person *person = [self.family objectAtIndex:i];
        [self.personManager printPerson:person];
    }
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.family count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default_cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default_Cell"];
    }

    Person *person = [self.family objectAtIndex:indexPath.row];

    [cell.textLabel setText:person.name];
    [cell.detailTextLabel setText:[person.birthDay shortString]];

    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Person *selectedPerson = self.family[(NSUInteger) indexPath.row];

    PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithPerson:selectedPerson];
    [self.navigationController pushViewController:personDetailViewController animated:YES];

}


@end
