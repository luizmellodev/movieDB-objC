//
//  MovieDetailTableViewCell.h
//  movieObjC
//
//  Created by Luiz Eduardo Mello dos Reis on 24/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieGenres;
@property (weak, nonatomic) IBOutlet UILabel *voteAverage;

@end

NS_ASSUME_NONNULL_END
