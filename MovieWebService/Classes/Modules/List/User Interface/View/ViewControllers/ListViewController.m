//
//  ViewController.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "ListViewController.h"
#import "MovieCell.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "ListPresenter.h"

static NSString *TableViewCellIdentifier = @"kMovieCell";
static NSString *NibName = @"MovieCell";

@interface ListViewController () {
    NSArray *list;
}
@property (nonatomic, strong) IBOutlet UITableView *strongTableView;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.strongTableView = self.tableView;
    
    //Register nib
    UINib *cellNib = [UINib nibWithNibName:NibName bundle:nil];
    [self.strongTableView registerNib:cellNib forCellReuseIdentifier:TableViewCellIdentifier];
    
    [self configureView];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}


- (void)configureView
{
    //Add Navigation title if required, Did it on the storyboard
}


- (void)showList:(NSArray *)data;
{
    self.view = self.tableView;
    
    list = data;
    [self reloadEntries];
}


- (void)reloadEntries
{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- TableView Data Source --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return list.count;
}

#pragma mark -- TableView Data Source --
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    //Reuse cell
    MovieCell *cell = [self.strongTableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil){
        //initialize the cell view from the xib file
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:NibName
                                                      owner:self options:nil];
        cell = (MovieCell *)[nibs objectAtIndex:0];
    }
    
    // Configure the cell...
    [cell setupCell:[list objectAtIndex:row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.eventHandler filmTapped:[list objectAtIndex:indexPath.row]];
    //    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    //    NSDictionary *film = [list objectAtIndex:indexPath.row];
    //    [detailViewController setData:[film valueForKey:@"director"]];
    //    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
