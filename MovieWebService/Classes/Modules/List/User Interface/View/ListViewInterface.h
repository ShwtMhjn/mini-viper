//
//  ListViewInterface.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#import <Foundation/Foundation.h>

//@class MovieDetailsDataDisplay;


// The public interface to talk to the Views
@protocol ListViewInterface <NSObject>

- (void)showList:(NSArray *)data;

@end
