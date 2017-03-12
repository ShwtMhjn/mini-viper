//
//  ListInteractorIO.h
//  MovieWebService
//
//  Created by Sasha on 08/03/17.
//

#ifndef ListInteractorIO_h
#define ListInteractorIO_h

@protocol ListInteractorInput <NSObject>

- (void)findFilms;
- (void) findDetailsForFilm:(id)film;

@end


@protocol ListInteractorOutput <NSObject>

- (void)foundFilms:(NSArray *)films;

@end

#endif /* ListInteractorIO_h */
