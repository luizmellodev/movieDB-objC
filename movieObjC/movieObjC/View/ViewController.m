//
//  ViewController.m
//  movieObjC
//
//  Created by Luiz Eduardo Mello dos Reis on 22/03/22.
//

#import "ViewController.h"
#import "MovieList.h"
#import "TheMovie.h"

@interface ViewController ()

//@property (strong, nonatomic) NSMutableArray<TheMovie *> *movies;

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
        NSDictionary *movieListJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSLog(@"%@", movieListJSON);

//        NSDictionary *movieListDict = movieListJSON;
        NSArray *movies = movieListJSON[@"results"];
        
        for (NSDictionary *movie in movies) {
            TheMovie *theMovie = TheMovie.new;
            theMovie.title = movie[@"title"];
            NSLog(@"%@", theMovie.title);
        }
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    self.movies.count
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movie" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%li", indexPath.row);
}

@end
