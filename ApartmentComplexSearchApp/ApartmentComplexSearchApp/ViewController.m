//
//  ViewController.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 13/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "DataManagerDelegate.h"
#import "ApartmentTableViewCell.h"
#import "LoadMoreTableViewCell.h"
#import "LoadMoreTableViewCellDelegate.h"

@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    DataManagerDelegate,
    LoadMoreTableViewCellDelegate
>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DataManager *dataManager;

@property (nonatomic, strong) NSArray *apartmentList;
@property (nonatomic, assign) NSInteger offset;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.offset = 0;
    self.apartmentList = [NSArray array];
    
    self.dataManager = [[DataManager alloc] init];
    self.dataManager.delegate = self;
    
    [self.dataManager loadDataWithCount:10 offset:self.offset priceFrom:0 priceTo:0];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ApartmentTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"ApartmentTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LoadMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoadMoreTableViewCell"];
}

#pragma mark (Table View)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apartmentList.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.apartmentList.count)
    {
        ApartmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApartmentTableViewCell"
                                                                       forIndexPath:indexPath];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ApartmentTableViewCell" owner:self options:nil];
            cell = [nib firstObject];
        }
        
        [cell fillWithApartment:self.apartmentList[indexPath.row]];
        
        return cell;
    }
    else
    {
        LoadMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreTableViewCell"
                                                                       forIndexPath:indexPath];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LoadMoreTableViewCell" owner:self options:nil];
            cell = [nib firstObject];
        }
        
        cell.delegate = self;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

#pragma mark - DataManagerDelegate

- (void)dataManagerDidLoadData:(NSArray *)data
{
    self.apartmentList = data;
    
    [self.tableView reloadData];
}

#pragma mark - LoadMoreTableViewCellDelegate

- (void)loadMoreCellDidTapped
{
    self.offset += 10;
    
     [self.dataManager loadDataWithCount:10 offset:self.offset priceFrom:0 priceTo:0];
}

@end
