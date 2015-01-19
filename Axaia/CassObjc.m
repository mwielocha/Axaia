//
//  CassandraWrapper.m
//  Axaia
//
//  Created by Mikołaj Wielocha on 18/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CassObjc.h"
#import "CassCpp.h"

@implementation CassObjc {
    CassCpp* cass;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        cass = [[CassCpp alloc] init];
    }
    return self;
}

- (void) connect:(NSString*)contactPoints
{
    [cass connect:contactPoints];
}
- (void) query:(NSString *)query
{
    [cass query:query];
}
@end
