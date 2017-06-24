#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
#import "tns1.h"
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "OrderServiceImplSvc.h"
#import "tns1.h"
@class OrderServiceImplSoapBinding;
@interface OrderServiceImplSvc : NSObject {
	
}
+ (OrderServiceImplSoapBinding *)OrderServiceImplSoapBinding;
@end
@class OrderServiceImplSoapBindingResponse;
@class OrderServiceImplSoapBindingOperation;
@protocol OrderServiceImplSoapBindingResponseDelegate <NSObject>
- (void) operation:(OrderServiceImplSoapBindingOperation *)operation completedWithResponse:(OrderServiceImplSoapBindingResponse *)response;
@end
@interface OrderServiceImplSoapBinding : NSObject <OrderServiceImplSoapBindingResponseDelegate> {
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
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(OrderServiceImplSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (OrderServiceImplSoapBindingResponse *)paymentStatusChangeUsingParameters:(tns1_paymentStatusChange *)aParameters ;
- (void)paymentStatusChangeAsyncUsingParameters:(tns1_paymentStatusChange *)aParameters  delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (OrderServiceImplSoapBindingResponse *)queryUsingParameters:(tns1_query *)aParameters ;
- (void)queryAsyncUsingParameters:(tns1_query *)aParameters  delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (OrderServiceImplSoapBindingResponse *)submitUsingParameters:(tns1_submit *)aParameters ;
- (void)submitAsyncUsingParameters:(tns1_submit *)aParameters  delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (OrderServiceImplSoapBindingResponse *)deleteUsingParameters:(tns1_delete *)aParameters ;
- (void)deleteAsyncUsingParameters:(tns1_delete *)aParameters  delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)responseDelegate;
@end
@interface OrderServiceImplSoapBindingOperation : NSOperation {
	OrderServiceImplSoapBinding *binding;
	OrderServiceImplSoapBindingResponse *response;
	id<OrderServiceImplSoapBindingResponseDelegate>__unsafe_unretained delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) OrderServiceImplSoapBinding *binding;
@property (readonly) OrderServiceImplSoapBindingResponse *response;
@property (nonatomic, assign) id<OrderServiceImplSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(OrderServiceImplSoapBinding *)aBinding delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)aDelegate;
@end
@interface OrderServiceImplSoapBinding_paymentStatusChange : OrderServiceImplSoapBindingOperation {
	tns1_paymentStatusChange * parameters;
}
@property (retain) tns1_paymentStatusChange * parameters;
- (id)initWithBinding:(OrderServiceImplSoapBinding *)aBinding delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_paymentStatusChange *)aParameters
;
@end
@interface OrderServiceImplSoapBinding_query : OrderServiceImplSoapBindingOperation {
	tns1_query * parameters;
}
@property (retain) tns1_query * parameters;
- (id)initWithBinding:(OrderServiceImplSoapBinding *)aBinding delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_query *)aParameters
;
@end
@interface OrderServiceImplSoapBinding_submit : OrderServiceImplSoapBindingOperation {
	tns1_submit * parameters;
}
@property (retain) tns1_submit * parameters;
- (id)initWithBinding:(OrderServiceImplSoapBinding *)aBinding delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_submit *)aParameters
;
@end
@interface OrderServiceImplSoapBinding_delete : OrderServiceImplSoapBindingOperation {
	tns1_delete * parameters;
}
@property (retain) tns1_delete * parameters;
- (id)initWithBinding:(OrderServiceImplSoapBinding *)aBinding delegate:(id<OrderServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_delete *)aParameters
;
@end
@interface OrderServiceImplSoapBinding_envelope : NSObject {
}
+ (OrderServiceImplSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface OrderServiceImplSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
