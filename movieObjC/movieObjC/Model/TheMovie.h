//
//  TheMovie.h
//  movieObjC
//
//  Created by Alex Freitas on 23/03/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheMovie : NSObject

@property (strong, nonatomic) NSNumber *identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *posterPath;
@property (strong, nonatomic) NSString *backdropPath;

@end

NS_ASSUME_NONNULL_END
