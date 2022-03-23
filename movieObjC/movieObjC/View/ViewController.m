//
//  ViewController.m
//  movieObjC
//
//  Created by Luiz Eduardo Mello dos Reis on 22/03/22.
//

#import "ViewController.h"
#import "TheMovie.h"
#import "TheMovieTableViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<TheMovie *> *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchMovieData];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)fetchMovieData {
    NSString *urlString = @"https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=88c7ef8c629429f93f34e6558bb26c14";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSDictionary *movieListPageJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSArray *movieList = movieListPageJSON[@"results"];
        
        NSMutableArray<TheMovie *> *movies = NSMutableArray.new;
        for (NSDictionary *movie in movieList) {
            TheMovie *theMovie = TheMovie.new;
            theMovie.identifier = movie[@"id"];
            theMovie.title = movie[@"title"];
            theMovie.overview = movie[@"overview"];
            theMovie.posterPath = movie[@"poster_path"];
            theMovie.voteAverage = movie[@"vote_average"];
            
            [movies addObject: theMovie];
        }
        
        self.movies = movies;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TheMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    
    TheMovie *movie = TheMovie.new;
    movie = self.movies[indexPath.row];
    
    cell.movieTitle.text = movie.title;
    cell.overview.text = movie.overview;
    cell.voteAverage.text = movie.voteAverage.stringValue;
    
    NSString *urlPrefix = @"https://image.tmdb.org/t/p/w500";
    NSString *imageString = [NSString stringWithFormat:@"%@%@", urlPrefix, movie.posterPath];
    NSURL *imageUrl = [NSURL URLWithString: imageString];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: imageUrl];
    UIImage *image = [UIImage imageWithData: imageData];
    cell.moviePoster.image = image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%li", indexPath.row);
}

@end
