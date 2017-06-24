#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
#import "tns1.h"
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "LoginServiceImpl.h"
#import "tns1.h"
@class LoginServiceImplSoapBinding;
@interface LoginServiceImpl : NSObject {
	
}
+ (LoginServiceImplSoapBinding *)LoginServiceImplSoapBinding;
@end
@class LoginServiceImplSoapBindingResponse;
@class LoginServiceImplSoapBindingOperation;
@protocol LoginServiceImplSoapBindingResponseDelegate <NSObject>
- (void) operation:(LoginServiceImplSoapBindingOperation *)operation completedWithResponse:(LoginServiceImplSoapBindingResponse *)response;
@end
@interface LoginServiceImplSoapBinding : NSObject <LoginServiceImplSoapBindingResponseDelegate> {
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
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(LoginServiceImplSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (LoginServiceImplSoapBindingResponse *)modifyUsingParameters:(tns1_modify *)aParameters ;
- (void)modifyAsyncUsingParameters:(tns1_modify *)aParameters  delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (LoginServiceImplSoapBindingResponse *)registerUsingParameters:(tns1_register *)aParameters ;
- (void)registerAsyncUsingParameters:(tns1_register *)aParameters  delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)responseDelegate;
- (LoginServiceImplSoapBindingResponse *)loginUsingParameters:(tns1_login *)aParameters ;
- (void)loginAsyncUsingParameters:(tns1_login *)aParameters  delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)responseDelegate;
@end
@interface LoginServiceImplSoapBindingOperation : NSOperation {
	LoginServiceImplSoapBinding *binding;
	LoginServiceImplSoapBindingResponse *response;
	id<LoginServiceImplSoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) LoginServiceImplSoapBinding *binding;
@property (readonly) LoginServiceImplSoapBindingResponse *response;
@property (nonatomic) id<LoginServiceImplSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(LoginServiceImplSoapBinding *)aBinding delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)aDelegate;
@end
@interface LoginServiceImplSoapBinding_modify : LoginServiceImplSoapBindingOperation {
	tns1_modify * parameters;
}
@property (retain) tns1_modify * parameters;
- (id)initWithBinding:(LoginServiceImplSoapBinding *)aBinding delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_modify *)aParameters
;
@end
@interface LoginServiceImplSoapBinding_register : LoginServiceImplSoapBindingOperation {
	tns1_register * parameters;
}
@property (retain) tns1_register * parameters;
- (id)initWithBinding:(LoginServiceImplSoapBinding *)aBinding delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_register *)aParameters
;
@end
@interface LoginServiceImplSoapBinding_login : LoginServiceImplSoapBindingOperation {
	tns1_login * parameters;
}
@property (retain) tns1_login * parameters;
- (id)initWithBinding:(LoginServiceImplSoapBinding *)aBinding delegate:(id<LoginServiceImplSoapBindingResponseDelegate>)aDelegate
	parameters:(tns1_login *)aParameters
;
@end
@interface LoginServiceImplSoapBinding_envelope : NSObject {
}
+ (LoginServiceImplSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface LoginServiceImplSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
