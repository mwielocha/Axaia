#import "Cassandra.h"
#import <cassandra.h>
#import <stdio.h>

@implementation Cassandra {
    CassCluster* cluster;
    CassSession* session;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        cluster = cass_cluster_new();
        session = cass_session_new();
        NSLog(@"Cluster created...");
    }
    return self;
}

- (void) connect:(NSString*)contactPoints
{
    
    NSLog(@"Connecting to: %@", contactPoints);
    
    const char *contactPointsCpp = [contactPoints UTF8String];
    
    cass_cluster_set_contact_points(cluster, contactPointsCpp);
    
    cass_future_error_code(cass_session_connect(session, cluster));
}
@end