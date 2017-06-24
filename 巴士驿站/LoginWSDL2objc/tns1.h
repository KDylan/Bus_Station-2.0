#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns1_login;
@class tns1_loginResponse;
@class tns1_modify;
@class tns1_modifyResponse;
@class tns1_register;
@class tns1_registerResponse;
@interface tns1_login : NSObject {
	
/* elements */
	NSString * userName;
	NSString * password;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_login *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * userName;
@property (retain) NSString * password;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_loginResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_loginResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_modify : NSObject {
	
/* elements */
	NSString * userID;
	NSString * userRole;
	NSString * userName;
	NSString * userPwd;
	NSNumber * userPhoneNumber;
	NSString * userEmail;
	NSString * userAvatorURL;
	NSString * userCurrentLocation;
	NSString * userIDCardType;
	NSNumber * userIDCardNo;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_modify *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * userID;
@property (retain) NSString * userRole;
@property (retain) NSString * userName;
@property (retain) NSString * userPwd;
@property (retain) NSNumber * userPhoneNumber;
@property (retain) NSString * userEmail;
@property (retain) NSString * userAvatorURL;
@property (retain) NSString * userCurrentLocation;
@property (retain) NSString * userIDCardType;
@property (retain) NSNumber * userIDCardNo;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_modifyResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_modifyResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_register : NSObject {
	
/* elements */
	NSString * userID;
	NSString * userRole;
	NSString * userName;
	NSString * userPwd;
	NSNumber * userPhoneNumber;
	NSString * userEmail;
	NSString * userAvatorURL;
	NSString * userCurrentLocation;
	NSString * userIDCardType;
	NSNumber * userIDCardNo;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_register *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * userID;
@property (retain) NSString * userRole;
@property (retain) NSString * userName;
@property (retain) NSString * userPwd;
@property (retain) NSNumber * userPhoneNumber;
@property (retain) NSString * userEmail;
@property (retain) NSString * userAvatorURL;
@property (retain) NSString * userCurrentLocation;
@property (retain) NSString * userIDCardType;
@property (retain) NSNumber * userIDCardNo;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface tns1_registerResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_registerResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
