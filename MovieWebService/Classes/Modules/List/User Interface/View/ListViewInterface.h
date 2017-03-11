//
//  ListViewInterface.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>

//@class MovieDetailsDataDisplay;


// The public interface to talk to the Views
@protocol ListViewInterface <NSObject>

- (void)showList:(NSArray *)data;

@end
