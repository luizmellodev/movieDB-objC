//
//  MovieDetailViewController.h
//  movieObjC
//
//  Created by Alex Freitas on 24/03/2022.
//

#import <UIKit/UIKit.h>
#import "TheMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;



@property (strong, nonatomic) TheMovie *movie;

@end

NS_ASSUME_NONNULL_END
