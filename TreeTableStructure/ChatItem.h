//
//  ChatItem.h
//  TreeTableStructure
//
//  Created by Vidya on 31/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatItem : NSObject

@property (nonatomic, strong) NSString *base, *path;
@property (nonatomic) NSInteger numberOfSubitems;
@property (nonatomic, strong) ChatItem *parentSelectingItem;
@property (nonatomic, strong) NSMutableArray *ancestorSelectingItems;
@property (nonatomic) NSInteger submersionLevel;

@property (nonatomic, strong) NSString *m_cID;
@property (nonatomic, strong) NSString *m_cTitle;
@property (nonatomic, strong) NSString *m_cSubTitle;
@property (nonatomic, strong) NSString *m_cType;
@property (nonatomic, strong) NSString *m_cDate;
@property (nonatomic, strong) NSMutableArray *m_cFlirtReplies;

- (BOOL)isEqualToSelectingItem:(ChatItem *)selectingItem;

@end
