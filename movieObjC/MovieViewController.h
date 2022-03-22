//
//  MovieViewController.h
//  movieObjC
//
//  Created by Luiz Eduardo Mello dos Reis on 22/03/22.
//

#ifndef MovieViewController_h
#define MovieViewController_h

@interface MovieViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *movies;


#endif /* MovieViewController_h */
