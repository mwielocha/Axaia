#import "Cassandra.h"
#import <cassandra.h>
#import <stdio.h>
#import "CassCpp.h"
#import "Entity.h"

@implementation CassCpp {
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

- (void) query:(NSString *)query
{
    NSLog(@"Querying: %@", query);
    
    const char *queryCpp = [query UTF8String];
    
    CassString queryCass = cass_string_init(queryCpp);
    
    CassStatement* statement = cass_statement_new(queryCass, 0);
    
    CassFuture* result_future = cass_session_execute(session, statement);
    
    if(cass_future_error_code(result_future) == CASS_OK) {
        /* Retrieve result set and iterator over the rows */
        const CassResult* result = cass_future_get_result(result_future);
        CassIterator* rows = cass_iterator_from_result(result);
        
        while(cass_iterator_next(rows)) {
            
            const CassRow* row = cass_iterator_get_row(rows);
            CassIterator* columns = cass_iterator_from_row(row);
            
            while(cass_iterator_next(columns))
            {
                const CassValue* column = cass_iterator_get_column(columns);
                CassString column_name;
                cass_value_get_string(column, &column_name);
                
                printf("column_name: '%.*s'\n", (int)column_name.length,
                       column_name.data);
                
                const CassValue* column_value = cass_row_get_column_by_name(row, column_name.data);
                
                CassString column_v;
                cass_value_get_string(column_value, &column_v);
                
                printf("column_value: '%.*s'\n", (int)column_v.length,
                       column_v.data);
            }
            
            cass_iterator_free(columns);
        }
        
        cass_result_free(result);
        cass_iterator_free(rows);
    } else {
        /* Handle error */
        CassString message = cass_future_error_message(result_future);
        fprintf(stderr, "Unable to run query: '%.*s'\n", (int)message.length,
                message.data);
    }
}
@end