//
//  LoadMoreTableViewCell.h
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoadMoreTableViewCellDelegate;

@interface LoadMoreTableViewCell : UITableViewCell

@property (nonatomic, weak) id<LoadMoreTableViewCellDelegate> delegate;

@end
