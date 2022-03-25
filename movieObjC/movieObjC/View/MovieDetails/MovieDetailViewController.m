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

- (void)fetchMovieData {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"https://api.themoviedb.org/3/movie/%@/?api_key=06ba203a54577bd8c91c3b4d4b14d0ec&language=en-US",self.movie.identifier]];

    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSError *err;
        NSDictionary *movieListPageJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }

        NSArray *movieList = movieListPageJSON[@"results"];

        for (NSDictionary *movie in movieList) {
            TheMovie *themovieDetails = TheMovie.new;
            themovieDetails.identifier = movie[@"id"];
            themovieDetails.overview = movie[@"overview"];


//            [movies addObject: themovieDetails];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.detailTableView reloadData];
        });

    }] resume];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MovieDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moviedetail" forIndexPath:indexPath];
        
//        NSString *testString = @"Teste de genero";
        
        cell.movieTitle.text = self.movie.title;
        cell.voteAverage.text = self.movie.voteAverage.stringValue;
//        cell.movieGenres.text = testString;
        
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

        cell.OverviewText.text =self.movie.overview;
        
        return cell;
}

@end
