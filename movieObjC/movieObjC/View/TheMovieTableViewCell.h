//
//  TheMovieTableViewCell.h
//  movieObjC
//
//  Created by Alex Freitas on 23/03/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheMovieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *overview;
@property (strong, nonatomic) IBOutlet UILabel *voteAverage;
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;

@end

NS_ASSUME_NONNULL_END
