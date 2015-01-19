//
//  CassRow.h
//  Axaia
//
//  Created by Mikołaj Wielocha on 19/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

#ifndef Axaia_CassRow_h
#define Axaia_CassRow_h

@protocol Row
- (void) connect:(NSString*)contactPoints;
- (void) query:(NSString*)query;
@end

#endif
