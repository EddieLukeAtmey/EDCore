//
//  TDJSON.h
//  Pods
//
//  Created by sa vincent on 3/2/16.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (TDJSON)
- (NSString *)td_JSONFragment;
@end

@interface NSArray (TDJSON)
- (NSString *)td_JSONRepresentation;
- (NSString *)td_JSONRepresentationWithOptions:(NSDictionary *)opts;
@end

@interface NSDictionary (TDJSON)
- (NSString *)td_JSONRepresentation;
- (NSString *)td_JSONRepresentationWithOptions:(NSDictionary *)opts;
@end
