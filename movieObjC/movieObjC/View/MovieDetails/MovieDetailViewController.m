//
//  MovieDetailViewController.m
//  movieObjC
//
//  Created by Alex Freitas on 24/03/2022.
//

#import "MovieDetailViewController.h"
#import "MovieDetailTableViewCell.h"
#import "OverviewTableViewCell.h"



@interface MovieDetailViewController ()



@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MovieDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moviedetail" forIndexPath:indexPath];
        
        NSString *testString = @"Teste de genero";
        
        cell.movieTitle.text = self.movie.title;
        cell.voteAverage.text = self.movie.voteAverage.stringValue;
        cell.movieGenres.text = testString;
        
        // MARK:: separar em outra classe (?)
        NSString *urlPrefix = @"https://image.tmdb.org/t/p/w500";
        NSString *imageString = [NSString stringWithFormat:@"%@%@", urlPrefix, self.movie.posterPath];
        NSURL *imageUrl = [NSURL URLWithString: imageString];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL: imageUrl];
        UIImage *image = [UIImage imageWithData: imageData];
        cell.moviePoster.image = image;
        
        return cell;
    }
        OverviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moviedetailoverview" forIndexPath:indexPath];
        NSString *testString2 = @"Teste de generoTeste de generoTeste de generoTeste de generoTeste de generoTeste de generoTeste de genero";

        cell.OverviewText.text =testString2;
        
        return cell;
}

@end
