#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
#import "PassengerTns1.h"
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "PassengerServiceImplSvc.h"
#import "PassengerTns1.h"
@class PassengerServiceImplSoapBinding;
@interface PassengerServiceImplSvc : NSObject {
	
}
+ (PassengerServiceImplSoapBinding *)PassengerServiceImplSoapBinding;
@end
@class PassengerServiceImplSoapBindingResponse;
@class PassengerServiceImplSoapBindingOperation;
@protocol PassengerServiceImplSoapBindingResponseDelegate <NSObject>
- (void) operation:(PassengerServiceImplSoapBindingOperation *)operation completedWithResponse:(PassengerServiceImplSoapBindingResponse *)response;
@end
@interface PassengerServiceImplSoapBinding : NSObject <PassengerServiceImplSoapBindingResponseDelegate> {
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
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(PassengerServiceImplSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (PassengerServiceImplSoapBindingResponse *)queryUsingParameters:(PassengerTns1_query *)aParameters ;
- (void)queryAsyncUsingParameters:(PassengerTns1_query *)aParameters  delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (PassengerServiceImplSoapBindingResponse *)submitUsingParameters:(PassengerTns1_submit *)aParameters ;
- (void)submitAsyncUsingParameters:(PassengerTns1_submit *)aParameters  delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (PassengerServiceImplSoapBindingResponse *)modifyUsingParameters:(PassengerTns1_modify *)aParameters ;
- (void)modifyAsyncUsingParameters:(PassengerTns1_modify *)aParameters  delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (PassengerServiceImplSoapBindingResponse *)deleteUsingParameters:(PassengerTns1_delete *)aParameters ;
- (void)deleteAsyncUsingParameters:(PassengerTns1_delete *)aParameters  delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (PassengerServiceImplSoapBindingResponse *)selectUsingParameters:(PassengerTns1_select *)aParameters ;
- (void)selectAsyncUsingParameters:(PassengerTns1_select *)aParameters  delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)responseDelegate;
@end
@interface PassengerServiceImplSoapBindingOperation : NSOperation {
	PassengerServiceImplSoapBinding *binding;
	PassengerServiceImplSoapBindingResponse *response;
	id<PassengerServiceImplSoapBindingResponseDelegate>__unsafe_unretained delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) PassengerServiceImplSoapBinding *binding;
@property (readonly) PassengerServiceImplSoapBindingResponse *response;
@property (nonatomic, assign) id<PassengerServiceImplSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate;
@end
@interface PassengerServiceImplSoapBinding_query : PassengerServiceImplSoapBindingOperation {
	PassengerTns1_query * parameters;
}
@property (retain) PassengerTns1_query * parameters;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(PassengerTns1_query *)aParameters
;
@end
@interface PassengerServiceImplSoapBinding_submit : PassengerServiceImplSoapBindingOperation {
	PassengerTns1_submit * parameters;
}
@property (retain) PassengerTns1_submit * parameters;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(PassengerTns1_submit *)aParameters
;
@end
@interface PassengerServiceImplSoapBinding_modify : PassengerServiceImplSoapBindingOperation {
	PassengerTns1_modify * parameters;
}
@property (retain) PassengerTns1_modify * parameters;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(PassengerTns1_modify *)aParameters
;
@end
@interface PassengerServiceImplSoapBinding_delete : PassengerServiceImplSoapBindingOperation {
	PassengerTns1_delete * parameters;
}
@property (retain) PassengerTns1_delete * parameters;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(PassengerTns1_delete *)aParameters
;
@end
@interface PassengerServiceImplSoapBinding_select : PassengerServiceImplSoapBindingOperation {
	PassengerTns1_select * parameters;
}
@property (retain) PassengerTns1_select * parameters;
- (id)initWithBinding:(PassengerServiceImplSoapBinding *)aBinding delegate:(id<PassengerServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(PassengerTns1_select *)aParameters
;
@end
@interface PassengerServiceImplSoapBinding_envelope : NSObject {
}
+ (PassengerServiceImplSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface PassengerServiceImplSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
