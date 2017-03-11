//
//  DetailsViewInterface.h
//  MovieWebService
//
//  Created by Sasha on 09/03/17.
//  Copyright © 2017 Tan, Michael (Agoda). All rights reserved.
//

#ifndef DetailsViewInterface_h
#define DetailsViewInterface_h

@protocol DetailsViewInterface <NSObject>

- (void)setDetails:(id)detailsData;
- (void)showMoreInformation:(id)data;

@end

#endif /* DetailsViewInterface_h */
