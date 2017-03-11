//
//  DetailViewController.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "DetailViewController.h"
#import "Constants.h"

@interface DetailViewController ()

@property (nonatomic, strong) id detailsData;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.eventHandler updateView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tapToShowMore = [[TappableLabel alloc] initWithFrame:CGRectMake(20.0f, 78.0f, 280.0f, 44.0f)];
    self.tapToShowMore.font = [UIFont systemFontOfSize:14.0f];
    self.tapToShowMore.delegate = self;
    self.tapToShowMore.text = @"Tap here to show more";
    [self.view addSubview:self.tapToShowMore];
    
    [self showDetails:self.detailsData];
}

- (void)setDetails:(id)detailsData
{
    self.detailsData = detailsData;
}

- (void)showDetails:(id)data {
    self.directorName.text = [data valueForKey:kDirectorName];
    self.actorName.text = [data valueForKey:kActorName];
    self.actorScreenName.text = [data valueForKey:kScreenName];
//    Director *director = (Director*)data;
//    self.directorName.text = director.name;
//    Actor *actor = (Actor *)[director.films.cast objectAtIndex:0];
//    if (actor) {
//        self.actorName.text = actor.name;
//        self.actorScreenName.text = actor.screenName;
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveTouch {
    self.tapToShowMore.hidden = YES;
    self.actorName.hidden = NO;
    self.actorScreenName.hidden = NO;
    self.actorNameTitle.hidden = NO;
    self.actorScreenNameTitle.hidden = NO;
}

@end
