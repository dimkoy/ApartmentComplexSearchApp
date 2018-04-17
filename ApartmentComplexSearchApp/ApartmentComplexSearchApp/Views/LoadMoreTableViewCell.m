//
//  LoadMoreTableViewCell.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "LoadMoreTableViewCell.h"
#import "LoadMoreTableViewCellDelegate.h"

@implementation LoadMoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonDidTapped:(UIButton *)sender
{
    [self.delegate loadMoreCellDidTapped];
}

@end
