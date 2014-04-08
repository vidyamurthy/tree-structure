//
//  ChatItem.m
//  TreeTableStructure
//
//  Created by Vidya on 31/03/14.
//  Copyright (c) 2014 Vidya Murthy. All rights reserved.
//

#import "ChatItem.h"

@implementation ChatItem

@synthesize base, path;
@synthesize numberOfSubitems;
@synthesize parentSelectingItem;
@synthesize ancestorSelectingItems;
@synthesize submersionLevel;

@synthesize m_cID;
@synthesize m_cTitle;
@synthesize m_cSubTitle;
@synthesize m_cType;
@synthesize m_cDate;
@synthesize m_cFlirtReplies;

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToSelectingItem:other];
}

- (BOOL)isEqualToSelectingItem:(ChatItem *)selectingItem {
	if (self == selectingItem)
        return YES;
	
	if ([base isEqualToString:selectingItem.base])
		if ([path isEqualToString:selectingItem.path])
			if (numberOfSubitems == selectingItem.numberOfSubitems)
				return YES;
	
	return NO;
}

@end
