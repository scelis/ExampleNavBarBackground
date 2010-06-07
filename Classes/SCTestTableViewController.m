/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "SCTestTableViewController.h"

@implementation SCTestTableViewController

#pragma mark -
#pragma mark View Lifecycle

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        [self setTitle:@"Test Table View"];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDataSource

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

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCTestTableViewController *tvc = [[SCTestTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [[self navigationController] pushViewController:tvc animated:YES];
    [tvc release];
}

@end
