//
//  MultiSelectTableViewCell.h
//  MultiSelectTableView
//
//  Created by Jamming on 12-3-21.
//  Copyright 2012 Jamming. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MultiSelectTableViewCell : UITableViewCell 
{
    UIImageView *  _mSelectedIndicator; //show the selected mark
    BOOL           _mSelected;        //differ from property selected
}

@property (nonatomic, assign) BOOL mSelected;


- (void)changeMSelectedState;

@end
