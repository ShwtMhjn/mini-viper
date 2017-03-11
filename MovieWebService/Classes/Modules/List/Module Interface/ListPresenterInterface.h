//
//  ListPresenterInterface.h
//  MovieWebService
//
//  Created by Sasha on 04/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
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
