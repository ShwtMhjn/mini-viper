//
//  ListPresenterInterface.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#ifndef ListPresenterInterface_h
#define ListPresenterInterface_h

#import <Foundation/Foundation.h>

//@class Film;

@protocol ListPresenterInterface <NSObject>

- (void)updateView;
- (void)filmTapped:(id)film;

@end

#endif /* ListPresenterInterface_h */
