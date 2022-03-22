//
//  Movie.h
//  movieObjC
//
//  Created by Luiz Eduardo Mello dos Reis on 22/03/22.
//

#ifndef Movie_h
#define Movie_h

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, assign) int *movieID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, copy) NSArray *genreIDs;
@property (nonatomic, copy) NSArray *genres;

@end

#endif /* Movie_h */
