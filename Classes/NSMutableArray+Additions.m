//
//  NSMutableArray+Additions.m
//  LiveSports
//
//  Created by Jamming on 12-3-20.
//  Copyright 2012 CVT. All rights reserved.
//

#import "NSMutableArray+Additions.h"


@implementation NSMutableArray (NSMutableArray_Additions)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex > self.count || toIndex > self.count || toIndex == fromIndex)
    {
        return;
    }
    
    id movedObj = [self objectAtIndex:fromIndex];
    [movedObj retain];
    [self removeObjectAtIndex:fromIndex];
    
    if (toIndex > self.count)
    {
        [self addObject:movedObj];
    }
    else
    {
        [self insertObject:movedObj atIndex:toIndex];
    }
    
    [movedObj release];
    
}


@end
