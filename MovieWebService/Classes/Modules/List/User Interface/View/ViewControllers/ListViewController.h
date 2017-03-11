//
//  ViewController.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewInterface.h"
#import "ListPresenterInterface.h"

@interface ListViewController : UITableViewController <ListViewInterface> {
}

@property (nonatomic, strong) id<ListPresenterInterface>    eventHandler;


@end

