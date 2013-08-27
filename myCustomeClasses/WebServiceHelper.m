
#import "WebServiceHelper.h"
#import "AppDelegate.h"
#import "GSObject.h"


@implementation WebServiceHelper

@synthesize serviceName;
@synthesize dictionary;
@synthesize dynamicParams;
@synthesize dynamicURL;



#pragma mark Common Request method

-(void)jsonPaseringWithPHP :(NSString *)datastring :(NSString *)urlString
{
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *postData = [datastring dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    //[request set];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    
    NSURLConnection *conn= [NSURLConnection connectionWithRequest:request  delegate:self];
    
    if(conn)
    {
        responseData=[[NSMutableData alloc] init];
    }
    [request release];

}
-(void)sendImageOnPHPServer :(NSString *)datastring :(NSString *)urlString
{
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *postData = [datastring dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    //[request set];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    
    NSURLConnection *conn= [NSURLConnection connectionWithRequest:request  delegate:self];
    
    if(conn)
    {
        responseData=[[NSMutableData alloc] init];
    }
    [request release];
    
}

-(void)requestWithURLandParams:(NSString*)urlString param:(NSDictionary*)params
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    dynamicParams=[[NSMutableDictionary alloc] init];
    dynamicParams=[params copy];
    dynamicURL = [url copy];
    NSLog(@"%@",dynamicURL);
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:dynamicURL];
    
    if(params)
    {
        NSString *jsonRequest = [NSString stringWithFormat:@"%@",[params JSONRepresentation]];
        NSLog(@"Url string : %@",[url description]);
        NSLog(@"requestttt====%@",jsonRequest);
        NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
        [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        // [request setHTTPBody:(NSData *)credential];
        
    }
    
    [request setHTTPMethod:@"POST"];
    // [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //  //[request setValue:@"123" forHTTPHeaderField:@"admin"];
    
    
    NSURLConnection *conn= [NSURLConnection connectionWithRequest:request  delegate:self];
    if(conn)
    {
        responseData=[[NSMutableData alloc] init];
    }
    [request release];
    
}

-(void)requestWithURL:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *conn= [NSURLConnection connectionWithRequest:request  delegate:self];
    if(conn)
    {
        responseData=[[NSMutableData alloc] init];
    }
    [request release];

}
////////////////////////////////////////////////////
///////////////////////////////////////////////////////
////////////////////////////////////////////////////


-(void)login:(NSString *)param 
{
    serviceName=@"Login";
    NSString *urlString=[NSString stringWithFormat:@"%@%@",URI_HTTP,param];
    NSLog(@"%@",urlString);
    NSLog(@"%@",param);
    [self requestWithURL:urlString];
    
}

-(void)changePassword:(NSString *) urlString
{
    serviceName=@"ChangePassword";
    NSString *postString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",postString);
    [self requestWithURL:postString];

}
-(void)registration:(NSString *) urlString
{
    serviceName=@"Registration";
    NSString *regString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",regString);
    [self requestWithURL:regString];
    
}

-(void)forgotPassword : (NSString *) urlString
{
    serviceName=@"ForgotPassword";
    NSString *regString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",regString);
    [self requestWithURL:regString];
}

-(void)createWishlist : (NSString *) urlString
{
    serviceName=@"CreateWishlist";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)creatRegistrtionFromAdin: (NSString *) urlString
{
    serviceName=@"CreateRegistrationFromAdmin";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)getWebStore: (NSString *) urlstring
{
    serviceName=@"GetWebStore";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlstring];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}


////// order web service //////////////////
-(void)getOrderList: (NSString *) urlString
{
    serviceName=@"GetOrderList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)addOrderList: (NSString *) urlString
{
    serviceName=@"AddOrderList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)deleteOrderList: (NSString *) urlString
{
    serviceName=@"DeleteOrderList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}

///////// offer web service ///////////////
-(void)getOfferList: (NSString *)urlString
{
    serviceName=@"GetOfferList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)addOffderList:(NSString *)urlString
{
    serviceName=@"AddOfferList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)deleteOfferList :(NSString *)urlString
{
    serviceName=@"DeleteOfferList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}

/////////  product web service ////
-(void)getProductList: (NSString *) urlString
{
    serviceName=@"GetProductList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)addProductList: (NSString *) urlString
{
    serviceName=@"AddProductList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)deleteProductList: (NSString *) urlString
{
    serviceName=@"DeleteProductList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}

//////////  wish list web service ///////

-(void)getWishList: (NSString *) urlString
{
    serviceName=@"GetWishList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)addWishList: (NSString *) urlString
{
    serviceName=@"AddWishList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)deleteWishList: (NSString *) urlString
{
    serviceName=@"DeleteWishList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)accountList :(NSString *) urlString
{
    serviceName=@"AccountList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)editProfile :(NSString *) urlString
{
    serviceName=@"EditPfrofile";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}

-(void)getKeywordForProduct :(NSString *) urlString
{
    serviceName=@"KeyWord";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}
-(void)getProductListAccordingtoWishlist :(NSString *) urlString
{
    serviceName=@"ProductListAccordingToWishList";
    NSString *wishString=[NSString stringWithFormat:@"%@%@",URI_HTTP,urlString];
    NSLog(@"%@",wishString);
    [self requestWithURL:wishString];
}



#pragma mark nsurlconnection delegate


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	
    [self.delegate gettingFail:[error localizedDescription]];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    responseString=[[NSMutableString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if ([serviceName isEqualToString:@"Login"])
    {
        [self.delegate loginSuccess:responseString];
    }
    else if ([serviceName isEqualToString:@"ChangePassword"])
    {
        [self.delegate changePassword:responseString];
    }
    else if ([serviceName isEqualToString:@"Registration"])
    {
        [self.delegate registration:responseString];
    }
    else if ([serviceName isEqualToString:@"ForgotPassword"])
    {
        [self.delegate forgotPassword:responseString];
    }
    else if ([serviceName isEqualToString:@"CreateWishlist"])
    {
        [self.delegate createWishlist:responseString];
    }
    else if ([serviceName isEqualToString:@"CreateRegistrationFromAdmin"])
    {
        [self.delegate creatRegistrtionFromAdin:responseString];
    }
    else if ([serviceName isEqualToString:@"GetWebStore"])
    {
        [self.delegate getWebStore:responseString];
    }
    ///////////////////////////////////////////////
    else if ([serviceName isEqualToString:@"GetOrderList"])
    {
        [self.delegate getOrderList:responseString];
    }
    else if ([serviceName isEqualToString:@"AddOrderList"])
    {
        [self.delegate addOrderList:responseString];
    }
    else if ([serviceName isEqualToString:@"DeleteOrderList"])
    {
        [self.delegate deleteOrderList:responseString];
    }
    //////////////////////////////////////////
    else if ([serviceName isEqualToString:@"GetOfferList"])
    {
        [self.delegate getOfferList:responseString];
    }
    else if ([serviceName isEqualToString:@"AddOfferList"])
    {
        [self.delegate addOffderList:responseString];
    }
    else if ([serviceName isEqualToString:@"DeleteOfferList"])
    {
        [self.delegate deleteOfferList:responseString];
    }
    /////////////////////////////////
    else if ([serviceName isEqualToString:@"GetProductList"])
    {
        [self.delegate getProductList:responseString];
    }
    else if ([serviceName isEqualToString:@"AddProductList"])
    {
        NSLog(@"%@",responseString);
        [self.delegate addProductList:responseString];
    }
    else if ([serviceName isEqualToString:@"DeleteProductList"])
    {
        [self.delegate deleteProductList:responseString];
    }
    ///////////////////////////////////////////
    else if ([serviceName isEqualToString:@"GetWishList"])
    {
        [self.delegate getWishList:responseString];
    }
    else if ([serviceName isEqualToString:@"AddWishList"])
    {
        [self.delegate addWishList:responseString];
    }
    else if ([serviceName isEqualToString:@"DeleteWishList"])
    {
        [self.delegate deleteWishList:responseString];
    }
    else if ([serviceName isEqualToString:@"AccountList"])
    {
        [self.delegate accountList:responseString];
    }
    else if ([serviceName isEqualToString:@"EditPfrofile"])
    {
        [self.delegate editProfile:responseString];
    }
    else if ([serviceName isEqualToString:@"KeyWord"])
    {
        [self.delegate getKeywordForProduct:responseString];
    }
    else if ([serviceName isEqualToString:@"ProductListAccordingToWishList"])
    {
        [self.delegate getProductListAccordingtoWishlist:responseString];
    }
    
   
    
            
    //
}



- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        
        return YES;
    }
    else
    {
        if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
        {
            return YES;
        }
    }
    return NO;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge: (NSURLAuthenticationChallenge *)challenge
{
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
        
    }
    else
    {
        if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
        {
            
            NSURLCredential *creden = [[NSURLCredential alloc] initWithUser:@"admin" password:@"123" persistence:NSURLCredentialPersistenceForSession];
            
            
            [[challenge sender] useCredential:creden forAuthenticationChallenge:challenge];
            [creden release];
        }
        else
        {
            [[challenge sender]cancelAuthenticationChallenge:challenge];
            
        }
    }
}



////////////////////////////////////////////////
////////////                     ///////////////
//////////// DATABASE CONNECTION ///////////////
////////////                     ///////////////
////////////////////////////////////////////////

#pragma mark -  database value on view
+(NSMutableDictionary *) dataReadFromLocalDataBase: (NSString *) databaseName :(NSString *) databaseQuery :(NSString *) queryName
{
	// Setup the database object
	// Get the path to the documents directory and append the databaseName
    NSMutableDictionary *allGOTDATA =[[NSMutableDictionary alloc] init];
    
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	NSString *databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    NSLog(@"%@",databasePath);
	NSFileManager   *fileManager = [NSFileManager defaultManager];
    BOOL   success = [fileManager fileExistsAtPath:databasePath];
    
    if(!success)
    {
        NSString  *databasepath1 = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasepath1 toPath:databasePath error:nil];
    }
    
	sqlite3 *database;
	
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK)
    {
		
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, [databaseQuery UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            if ([queryName isEqualToString:@"Follow"])
            {
                NSMutableArray *followNameArray = [[NSMutableArray alloc] init];
                NSMutableArray *staffNameArray =  [[NSMutableArray alloc] init];
                NSMutableArray *followTypeArray = [[NSMutableArray alloc] init];
                NSMutableArray *followInfoArray = [[NSMutableArray alloc] init];
                NSMutableArray *followDateArray = [[NSMutableArray alloc] init];
                while(sqlite3_step(compiledStatement) == SQLITE_ROW)
                {
                    // Read the data from the result row
                    NSString *followNane = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                    NSString *staffname = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                    
                    NSString *followtype = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                    
                    NSString *followinfo = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,2)];
                    NSString *followdate = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,1)];
                    
                    
                    if ([followNane length]==0)
                    {
                        [followNameArray addObject:@""];
                    }
                    else
                    {
                        [followNameArray addObject:followNane];
                        //  NSLog(@"%@",followNameArray);
                    }
                    if ([staffname length]==0)
                    {
                        [staffNameArray addObject:@""];
                    }
                    else
                    {
                        [staffNameArray addObject:staffname];
                    }
                    if ([followtype length]==0)
                    {
                        [followTypeArray addObject:@""];
                    }
                    else
                    {
                        [followTypeArray addObject:followtype];
                    }
                    if ([followinfo length]==0)
                    {
                        [followInfoArray addObject:@""];
                    }
                    else
                    {
                        [followInfoArray addObject:followinfo];
                    }
                    if ([followdate length]==0)
                    {
                        [followDateArray addObject:@""];
                    }
                    else
                    {
                        [followDateArray addObject:followdate];
                    }
                }
                [allGOTDATA setValue:followNameArray forKey:@"followNameArray"];
                [allGOTDATA setValue:staffNameArray forKey:@"staffNameArray"];
                [allGOTDATA setValue:followTypeArray forKey:@"followTypeArraay"];
                [allGOTDATA setValue:followInfoArray forKey:@"followinfoArray"];
                [allGOTDATA setValue:followDateArray forKey:@"followDateArray"];
                
                 [followNameArray release];
                 [staffNameArray release];
                 [followTypeArray release];
                 [followInfoArray release];
                [followDateArray release];
                
            }
            
            
          	// Loop through the results and add them to the feeds array
        }
        
        
        // Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
    return allGOTDATA;
}




@end
