//
//  MovieList.h
//  movieObjC
//
//  Created by Alex Freitas on 23/03/2022.
//

#import <Foundation/Foundation.h>
#import "TheMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieList : NSObject

@property (strong, nonatomic) NSNumber *page;
@property (strong, nonatomic) NSArray<TheMovie *> *results;
@property (strong, nonatomic) NSNumber *totalPages;
@property (strong, nonatomic) NSNumber *totalResults;

@end

NS_ASSUME_NONNULL_END
