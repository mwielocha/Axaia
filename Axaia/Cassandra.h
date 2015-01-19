//
//  Cassandra.h
//  Axaia
//
//  Created by Mikołaj Wielocha on 18/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

#ifndef Axaia_Cassandra_h
#define Axaia_Cassandra_h


#import <Foundation/Foundation.h>

@protocol Cassandra
- (void) connect:(NSString*)contactPoints;
- (void) query:(NSString*)query;
@end

#endif
