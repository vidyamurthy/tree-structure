//
//  ViewController.h
//  TreeTableStructure
//
//  Created by Vidya on 26/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SWTableViewCellDelegate> {
    
    NSMutableArray *m_cDataArray;
    NSMutableArray *m_cDisplayArray;
    NSMutableArray *treeItems;
    
    UITableView *m_cTableView;
    
    NSIndexPath *m_cDeletionPath;

}

@property (nonatomic, strong) NSMutableArray *treeItems;
@property (nonatomic, strong) NSMutableArray *selectedTreeItems;

@end
