
#import <Foundation/Foundation.h>
#import "GSObject.h"
#import <sqlite3.h>
#import "SBJSON.h"

#define URI_HTTP    @"http://iphonewebservices.pssoftweb.com/Webservices/Service1.svc/"
#define URLFORALLDATA @"http://www.educationbizz.co.uk/education/alldata.php?tablename="

@protocol WebServiceHelperDelegate<NSObject>
@required
-(void)gettingFail:(NSString*)error;

@optional
-(void)loginSuccess:(NSString*)response;
-(void)changePassword:(NSString *) response;
-(void)registration:(NSString *) response;
-(void)forgotPassword : (NSString *) response;
-(void)createWishlist : (NSString *) response;
-(void)creatRegistrtionFromAdin: (NSString *) response;
-(void)accountList :(NSString *) response;
-(void)getWebStore: (NSString *) response;
-(void)editProfile :(NSString *) response;

////// order web service //////////////////
-(void)getOrderList: (NSString *) response;
-(void)addOrderList: (NSString *) response;
-(void)deleteOrderList: (NSString *) response;

///////// offer web service ///////////////
-(void)getOfferList: (NSString *)response;
-(void)addOffderList:(NSString *)response;
-(void)deleteOfferList :(NSString *)response;

/////////  product web service ////
-(void)getProductList: (NSString *) response;
-(void)addProductList: (NSString *) response;
-(void)deleteProductList: (NSString *) response;
-(void)getKeywordForProduct :(NSString *) response;
-(void)getProductListAccordingtoWishlist :(NSString *) response;

//////////  wish list web service ///////

-(void)getWishList: (NSString *) response;
-(void)addWishList: (NSString *) response;
-(void)deleteWishList: (NSString *) response;






@end


@interface WebServiceHelper : NSObject
{
    NSMutableData   *responseData;
    
    
    NSString   *serviceName;
    
    NSDictionary    *parsedJSON;
    NSMutableString *responseString;
}
@property(nonatomic,strong)id <WebServiceHelperDelegate>delegate;
@property(nonatomic,strong)NSString *serviceName;
@property (nonatomic, strong) NSMutableDictionary *dynamicParams;
@property (nonatomic , strong) NSURL *dynamicURL;


@property (nonatomic, strong)NSDictionary *dictionary;
-(void)login:(NSString *)param;
-(void)changePassword:(NSString *) urlString;
-(void)registration:(NSString *) urlString;
-(void)forgotPassword : (NSString *) urlString;
-(void)createWishlist : (NSString *) urlString;
-(void)editProfile :(NSString *) urlString;
-(void)creatRegistrtionFromAdin: (NSString *) urlString;
-(void)accountList :(NSString *) urlString;
-(void)getKeywordForProduct :(NSString *) urlString;


-(void)getWebStore: (NSString *) urlstring;


////// order web service //////////////////
-(void)getOrderList: (NSString *) urlString;
-(void)addOrderList: (NSString *) urlString;
-(void)deleteOrderList: (NSString *) urlString;

///////// offer web service ///////////////
-(void)getOfferList: (NSString *)urlString;
-(void)addOffderList:(NSString *)urlString;
-(void)deleteOfferList :(NSString *)urlString;

/////////  product web service ////
-(void)getProductList: (NSString *) urlString;
-(void)addProductList: (NSString *) urlString;
-(void)deleteProductList: (NSString *) urlString;
-(void)getProductListAccordingtoWishlist :(NSString *) urlString;

//////////  wish list web service ///////

-(void)getWishList: (NSString *) urlString;
-(void)addWishList: (NSString *) urlString;
-(void)deleteWishList: (NSString *) urlString;


////////////////////////////////////////////////
////////////                     ///////////////
//////////// DATABASE CONNECTION ///////////////
////////////                     ///////////////
////////////////////////////////////////////////

+(NSMutableDictionary *) dataReadFromLocalDataBase: (NSString *) databaseName :(NSString *) databaseQuery :(NSString *) queryName;


@end
