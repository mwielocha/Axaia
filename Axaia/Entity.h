//
//  Column.h
//  Axaia
//
//  Created by Mikołaj Wielocha on 19/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject

@property (readonly, copy) NSString* key;
@property (readonly, copy) NSString* value;
@property (readonly, copy) NSMutableArray* children;

- (id) initWithKey:(NSString *)name value:(NSString *)value;
- (void) addChild:(Entity*) entity;

@end
