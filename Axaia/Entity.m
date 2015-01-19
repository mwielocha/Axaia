//
//  Column.m
//  Axaia
//
//  Created by Mikołaj Wielocha on 19/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

#import "Entity.h"

@implementation Entity

- (id) initWithKey:(id)key value:(id)value
{
    self = [super init];
    if(self)
    {
        _key = [key copy];
        _value = [value copy];
        _children = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (void) addChild:(Entity *)entity
{
    [_children addObject: entity];
}

@end
