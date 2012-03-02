//
//  SCTestTableViewController.m
//  ExampleNavBarBackground
//
//  Created by Sebastian Celis on 6/7/2010.
//  Copyright 2010-2012 Sebastian Celis. All rights reserved.
//

#import "SCTestTableViewController.h"

@implementation SCTestTableViewController

#pragma mark - Controller Lifecycle

- (id)initWithStyle:(UITableViewStyle)style
{
    if ((self = [super initWithStyle:style]))
    {
        [self setTitle:@"Test Table View"];
    }
    
    return self;
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[self tableView] dequeueReusableCellWithIdentifier:@"TableCell"];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableCell"] autorelease];
    }
    
    NSString *str = [NSString stringWithFormat:@"This is cell %d", [indexPath row]];
    [[cell textLabel] setText:str];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCTestTableViewController *tvc = [[SCTestTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [[self navigationController] pushViewController:tvc animated:YES];
    [tvc release];
}

@end
