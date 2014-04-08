//
//  ViewController.m
//  TreeTableStructure
//
//  Created by Vidya on 26/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import "ViewController.h"
#import "CustomChatTableViewCell.h"
#import "ChatItem.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize treeItems, selectedTreeItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSDateFormatter *lDateFormatter = [NSDateFormatter new];
    [lDateFormatter setDateFormat:@"hh:mm"];
    
    m_cDataArray = [NSMutableArray new];
    
    ChatItem *lChat1 = [ChatItem new];
    lChat1.m_cID = @"37689";
    lChat1.m_cTitle = @"My Flirt 1";
    lChat1.m_cSubTitle = @"first flirt message";
    lChat1.m_cType = @"myFlirt";
    lChat1.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lChat1 setBase:lChat1.m_cID];//@"Item 0"];
	[lChat1 setPath:@"/"];
	[lChat1 setSubmersionLevel:0];
	[lChat1 setParentSelectingItem:nil];
    
    ChatItem *lReply1 = [ChatItem new];
    lReply1.m_cID = @"54632";
    lReply1.m_cTitle = @"latest_message";
    lReply1.m_cSubTitle = @"latest_message_sender";
    lReply1.m_cType = @"flirtReply";
    lReply1.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lReply1 setBase:lReply1.m_cID];//@"Item 0 1"];
    [lReply1 setPath:[NSString stringWithFormat:@"/%@", lChat1.m_cID]];//@"/Item 0"];
	[lReply1 setSubmersionLevel:1];
	[lReply1 setParentSelectingItem:lChat1];
    [lReply1 setAncestorSelectingItems:nil];
    [lReply1 setNumberOfSubitems:0];
    
    NSMutableArray *lFlirtReplies1 = [NSMutableArray arrayWithObjects:lReply1, lReply1, lReply1, nil];

    [lChat1 setAncestorSelectingItems: lFlirtReplies1];
    [lChat1 setNumberOfSubitems:3];

    lChat1.m_cFlirtReplies = lFlirtReplies1;
    
    ////flirt conversation 2
    ChatItem *lChat2 = [ChatItem new];
    lChat2.m_cID = @"37234";
    lChat2.m_cTitle = @"My Flirt 2";
    lChat2.m_cSubTitle = @"second flirt message";
    lChat2.m_cType = @"myFlirt";
    lChat2.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lChat2 setBase:lChat2.m_cID];//@"Item 1"];
	[lChat2 setPath:@"/"];
	[lChat2 setSubmersionLevel:0];
	[lChat2 setParentSelectingItem:nil];
    
    ChatItem *lReply2 = [ChatItem new];
    lReply2.m_cID = @"59872";
    lReply2.m_cTitle = @"latest_message";
    lReply2.m_cSubTitle = @"latest_message_sender";
    lReply2.m_cType = @"flirtReply";
    lReply2.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lReply2 setBase:lReply2.m_cID];//@"Item 1 1"];
	[lReply2 setPath:[NSString stringWithFormat:@"/%@", lChat2.m_cID]];//@"/Item 1"];
	[lReply2 setSubmersionLevel:1];
	[lReply2 setParentSelectingItem:lChat2];
    [lReply2 setAncestorSelectingItems:nil];
    [lReply2 setNumberOfSubitems:0];
    
    NSMutableArray *lFlirtReplies2 = [NSMutableArray arrayWithObjects:lReply2, lReply2, nil];
    
    [lChat2 setAncestorSelectingItems: lFlirtReplies2];
    [lChat2 setNumberOfSubitems:2];
    
    lChat2.m_cFlirtReplies = lFlirtReplies2;

    ////replies to flirt message
    ChatItem *lChat3 = [ChatItem new];
    lChat3.m_cID = @"37123";
    lChat3.m_cTitle = @"Reply to Flirt1";
    lChat3.m_cSubTitle = @"Reply message";
    lChat3.m_cType = @"reply";
    lChat3.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lChat3 setBase:lChat3.m_cID];//@"Item 2"];
	[lChat3 setPath:@"/"];
	[lChat3 setSubmersionLevel:0];
	[lChat3 setParentSelectingItem:nil];
    [lChat3 setAncestorSelectingItems:nil];
    [lChat3 setNumberOfSubitems:0];
    
    ChatItem *lChat4 = [ChatItem new];
    lChat4.m_cID = @"37123";
    lChat4.m_cTitle = @"Reply to Flirt1";
    lChat4.m_cSubTitle = @"Reply message";
    lChat4.m_cType = @"reply";
    lChat4.m_cDate = [lDateFormatter stringFromDate:[NSDate date]];
    
    [lChat4 setBase:lChat4.m_cID];//@"Item 2"];
	[lChat4 setPath:@"/"];
	[lChat4 setSubmersionLevel:0];
	[lChat4 setParentSelectingItem:nil];
    [lChat4 setAncestorSelectingItems:nil];
    [lChat4 setNumberOfSubitems:0];
    
    
    m_cDataArray = [[NSMutableArray alloc] initWithObjects:lChat1, lChat2, lChat3, lChat4, nil];
    
    self.selectedTreeItems = [NSMutableArray array];
	// Do any additional setup after loading the view.
	
    
    self.treeItems = [NSMutableArray new];
	self.treeItems = [self listItemsAtPath:@"/"];
    
    m_cTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    m_cTableView.delegate = self;
    m_cTableView.dataSource = self;
    [m_cTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.view addSubview:m_cTableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Delegate Datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.treeItems count] > 0) {
        return [self.treeItems count];
    }
    else
        return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChatItem *treeItem = [self.treeItems objectAtIndex:indexPath.row];

    NSString *CellIdentifier = @"Cell";
    CustomChatTableViewCell *lCell = (CustomChatTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (lCell == nil) {
        lCell = [[CustomChatTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        lCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        lCell.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.2];
    }
    
    CustomChatTableViewCell __weak *weakCell = lCell;
    
    [lCell setAppearanceWithBlock:^{
        weakCell.leftUtilityButtons = nil;
        weakCell.rightUtilityButtons = [self rightButtons:treeItem.m_cType];
        weakCell.delegate = self;
        weakCell.containingTableView = tableView;
    } force:NO];
    
    [lCell setCellHeight:lCell.frame.size.height];
    
    
	
	lCell.treeItem = treeItem;

    [lCell setSublevel:[treeItem submersionLevel]];

    lCell.m_cChatTitle.text = treeItem.m_cTitle;
    lCell.m_cChatSubTitle.text = treeItem.m_cSubTitle;
    lCell.m_cTimeLabel.text = treeItem.m_cDate;
    
    return lCell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    CustomChatTableViewCell *cell = (CustomChatTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    ChatItem *lChatItem = [self.treeItems objectAtIndex:indexPath.row];
    
    if ([lChatItem.m_cType isEqualToString:@"myFlirt"]) {
        NSInteger insertTreeItemIndex = [self.treeItems indexOfObject:cell.treeItem];
        NSMutableArray *insertIndexPaths = [NSMutableArray array];
        NSMutableArray *insertselectingItems = [self listItemsAtPath:[cell.treeItem.path stringByAppendingPathComponent:cell.treeItem.base]];
        
        NSMutableArray *removeIndexPaths = [NSMutableArray array];
        NSMutableArray *treeItemsToRemove = [NSMutableArray array];
        
        
        NSMutableArray *lNewArray = [[NSMutableArray alloc] initWithArray:self.treeItems];
        
        ChatItem *lTemp;
        
        for (ChatItem *tmpTreeItem in insertselectingItems) {
            
            insertTreeItemIndex++;
            
            BOOL contains = NO;
            
            for (ChatItem *tmp2TreeItem in self.treeItems) { //if the item exists in the tree
                if ([tmp2TreeItem isEqualToSelectingItem:tmpTreeItem]) {
                    contains = YES;
                    
                    [self selectingItemsToDelete:tmp2TreeItem saveToArray:treeItemsToRemove];
                    
                    removeIndexPaths = [self removeIndexPathForTreeItems:(NSMutableArray *)treeItemsToRemove];
                }
            }
            
            for (ChatItem *tmp2TreeItem in treeItemsToRemove) {
                [lNewArray removeObject:tmp2TreeItem];
                
                for (ChatItem *tmp3TreeItem in self.selectedTreeItems) {
                    if ([tmp3TreeItem isEqualToSelectingItem:tmp2TreeItem]) {
                        NSLog(@"%@", tmp3TreeItem.base);
                        [self.selectedTreeItems removeObject:tmp2TreeItem];
                        break;
                    }
                }
            }
            
            if (!contains) {
                [tmpTreeItem setSubmersionLevel:tmpTreeItem.submersionLevel];
                
                lTemp = tmpTreeItem;
                [lNewArray insertObject:lTemp atIndex:insertTreeItemIndex];
                
                NSIndexPath *indexPth = [NSIndexPath indexPathForRow:insertTreeItemIndex inSection:0];
                [insertIndexPaths addObject:indexPth];
            }
        }
        
        [self.treeItems removeAllObjects];
        [self.treeItems addObjectsFromArray:lNewArray];
        
        if ([insertIndexPaths count])
            [tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationTop];
        
        if ([removeIndexPaths count])
            [tableView deleteRowsAtIndexPaths:removeIndexPaths withRowAnimation:UITableViewRowAnimationTop];
        

    }
    else{
        
        //navigate to the next view
    }
	
}

#pragma mark User Defined Methods

- (NSMutableArray *)listItemsAtPath:(NSString *)path {
    
    NSMutableArray *lArray = [NSMutableArray new];
    
    for (int i = 0; i < [m_cDataArray count]; i++)
    {
        ChatItem *lChat = [m_cDataArray objectAtIndex:i];
        if ([lChat.path isEqualToString:path]) {
            [lArray addObject:lChat];
        }
        else if (lChat.numberOfSubitems > 0){
            NSArray *lTempArray = [NSArray arrayWithArray:lChat.m_cFlirtReplies];
            ChatItem *lTempChat = [lTempArray firstObject];
            if ([lTempChat.path isEqualToString:path]) {
                [lArray addObjectsFromArray:lTempArray];
            }
            
        }
    }
    if ([lArray count] > 0) {
        return lArray;
    }
    else
        return nil;
}

- (void)selectingItemsToDelete:(ChatItem *)selItems saveToArray:(NSMutableArray *)deleteSelectingItems{
	for (ChatItem *obj in selItems.ancestorSelectingItems) {
		[self selectingItemsToDelete:obj saveToArray:deleteSelectingItems];
	}
	
	[deleteSelectingItems addObject:selItems];
}

- (NSMutableArray *)removeIndexPathForTreeItems:(NSMutableArray *)treeItemsToRemove {
	NSMutableArray *result = [NSMutableArray array];
	
	for (NSInteger i = 0; i < [m_cTableView numberOfRowsInSection:0]; ++i) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
		CustomChatTableViewCell *cell = (CustomChatTableViewCell *)[m_cTableView cellForRowAtIndexPath:indexPath];
        
		for (ChatItem *tmpTreeItem in treeItemsToRemove) {
			if ([cell.treeItem isEqualToSelectingItem:tmpTreeItem])
                if (![result containsObject:indexPath]) {
                    [result addObject:indexPath];
                }
		}
	}
	
	return result;
}

- (NSArray *)rightButtons:(NSString*)pType
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    NSString *lTitle;
    
    if ([pType isEqualToString:@"myFlirt"]) {
        lTitle = @"Deaktivieren";
    }
    else{
        lTitle = @"Löschen";
    }
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.00f green:0.23f blue:0.18f alpha:1.0]
                                                title:lTitle icon:[UIImage imageNamed:@"cross"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.51f green:0.73f blue:0.18 alpha:1.0f]
                                                title:@"Gefunden" icon:[UIImage imageNamed:@"check"]];
    
    return rightUtilityButtons;
}

#pragma mark SWTableViewCell Delegate Methods

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            // Delete button was pressed
            m_cDeletionPath = [m_cTableView indexPathForCell:cell];
            
            UIAlertView *lAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Sind Sie sicher, dass Sie löschen möchten?" delegate:self cancelButtonTitle:@"Nein" otherButtonTitles:@"Ja", nil];
            [lAlert show];
            
            break;
        }
        case 1:
        {
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    return YES;
}

#pragma mark UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            //Cancel - do nothing
            break;
        case 1:
            {
                ////check if it is not a parent chat
                ChatItem *lChatItem = [self.treeItems objectAtIndex:m_cDeletionPath.row];
                if ([lChatItem.m_cType isEqualToString:@"myFlirt"]) {
                  
                    NSMutableArray *insertselectingItems = [self listItemsAtPath:[lChatItem.path stringByAppendingPathComponent:lChatItem.base]];
                    
                    if ([insertselectingItems count] > 0) {
                        if ([self.treeItems containsObject:[insertselectingItems firstObject]]) {
                            [self tableView:m_cTableView didSelectRowAtIndexPath:m_cDeletionPath];
                        }
                    }
                }
                
                [self.treeItems removeObjectAtIndex:m_cDeletionPath.row];
                [m_cTableView deleteRowsAtIndexPaths:@[m_cDeletionPath] withRowAnimation:UITableViewRowAnimationLeft];
                
                
                
            }
            break;
            
        default:
            break;
    }
}

@end
