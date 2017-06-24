#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
#import "Querytns1.h"
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "QueryServiceImplSvc.h"
#import "Querytns1.h"
@class QueryServiceImplSoapBinding;
@interface QueryServiceImplSvc : NSObject {
	
}
+ (QueryServiceImplSoapBinding *)QueryServiceImplSoapBinding;
@end
@class QueryServiceImplSoapBindingResponse;
@class QueryServiceImplSoapBindingOperation;
@protocol QueryServiceImplSoapBindingResponseDelegate <NSObject>
- (void) operation:(QueryServiceImplSoapBindingOperation *)operation completedWithResponse:(QueryServiceImplSoapBindingResponse *)response;
@end
@interface QueryServiceImplSoapBinding : NSObject <QueryServiceImplSoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(QueryServiceImplSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (QueryServiceImplSoapBindingResponse *)executeQueryUsingParameters:(tns1_executeQuery *)aParameters ;
- (void)executeQueryAsyncUsingParameters:(tns1_executeQuery *)aParameters  delegate:(id<QueryServiceImplSoapBindingResponseDelegate>)responseDelegate;
@end
@interface QueryServiceImplSoapBindingOperation : NSOperation {
	QueryServiceImplSoapBinding *binding;
	QueryServiceImplSoapBindingResponse *response;
	id<QueryServiceImplSoapBindingResponseDelegate>__unsafe_unretained delegate;
	NSMutableData *responseData;
    NSURLConnection *urlConnection;
}
@property (retain) QueryServiceImplSoapBinding *binding;
@property (readonly) QueryServiceImplSoapBindingResponse *response;
@property (nonatomic, assign) id<QueryServiceImplSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(QueryServiceImplSoapBinding *)aBinding delegate:(id<QueryServiceImplSoapBindingResponseDelegate>)aDelegate;
@end
@interface QueryServiceImplSoapBinding_executeQuery : QueryServiceImplSoapBindingOperation {
	tns1_executeQuery * parameters;
}
@property (retain) tns1_executeQuery * parameters;
- (id)initWithBinding:(QueryServiceImplSoapBinding *)aBinding delegate:(id<QueryServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_executeQuery *)aParameters
;
@end
@interface QueryServiceImplSoapBinding_envelope : NSObject {
}
+ (QueryServiceImplSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface QueryServiceImplSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
