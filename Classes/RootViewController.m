//
//  RootViewController.m
//  MultiSelectTableView
//
//  Created by Jamming on 12-3-21.
//  Copyright 2012 Jamming. All rights reserved.
//

#import "RootViewController.h"
#import "MultiSelectTableViewCell.h"

#import "NSMutableArray+Additions.h"


@implementation RootViewController

static const int CELLS_NUM = 20;


#pragma mark -
#pragma mark Private

- (void)editSportAction:(UIBarButtonItem *)barButton
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if (self.tableView.editing)
    {
        barButton.title = NSLocalizedString(@"save", @"Save");
    }
    else
    {
        barButton.title = NSLocalizedString(@"edit", @"Edit");
        //save data opertation
    }
    
    
}


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad 
{
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    self.tableView.allowsSelectionDuringEditing = YES;
    
    UIBarButtonItem *editBarButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"edit", @"Edit") 
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(editSportAction:)];
    self.navigationItem.rightBarButtonItem = editBarButton;
    [editBarButton release];
    
    _selFlags = [[NSMutableArray alloc] initWithCapacity:CELLS_NUM];
    for (int i = 0; i < CELLS_NUM; i++)
    {
        [_selFlags addObject:[NSNumber numberWithBool:NO]];
    }
}


/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return (nil == _selFlags) ? 0 : _selFlags.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    MultiSelectTableViewCell *cell = (MultiSelectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MultiSelectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                                reuseIdentifier:CellIdentifier] autorelease];
        
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.backgroundView = [[[UIView alloc] init] autorelease];
    }
    
    cell.mSelected = [(NSNumber *)[_selFlags objectAtIndex:indexPath.row] boolValue];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView 
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [_selFlags moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}


#pragma mark -
#pragma mark Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing)
    {
        MultiSelectTableViewCell *cell = (MultiSelectTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        [cell changeMSelectedState];
        [_selFlags replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:cell.mSelected]];
    }
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc 
{
    [_selFlags release];
    [super dealloc];
}


@end

