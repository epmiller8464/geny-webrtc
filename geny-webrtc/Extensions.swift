//
//  Extensions.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/30/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation


public extension String{
	
	func length() -> Int {
		return count(self);
	}
	
	func isNilOrEmpty() -> Bool{
		return self.isEmpty || self.length() == 0;
	}
}

public extension NSDictionary {
	
	public static func dictionaryWithJSONString(jsonString:NSString?) -> NSDictionary {
		var data = jsonString!.dataUsingEncoding(NSUTF8StringEncoding);
		var error : NSErrorPointer? = nil;
		var dict = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.allZeros, error: error!) as! NSDictionary;
		if error != nil {
			println(error);
		}
		
		return dict;
	}
	
	public static func dictionaryWithJSONData(jsonData:NSData?) -> NSDictionary {
		
		var error : NSErrorPointer? = nil;
		var dict = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.allZeros, error: error!) as! NSDictionary;
		if error != nil {
			println(error);
		}
		
		return dict;
	}
	
	
}

public extension NSURLConnection {
	
	
	public static func sendAsyncRequest(request:NSURLRequest,completionHandler: ((response: NSURLResponse?, data:NSData?,error:NSError?) -> Void)?) -> Void {
		
		///kick off async request which will call back on the main thread.
		NSURLConnection.sendAsynchronousRequest(request,
			queue: NSOperationQueue.mainQueue(),
			completionHandler: {(r:NSURLResponse!, d:NSData!,e: NSError!) in
				if completionHandler != nil {
					completionHandler!(response:r!,data:d!,error:e!);
				}
		});
	}
	
	
	public static func sendAsyncPostToURL(url:NSURL?,withData data: NSData?,completionHandler: ((succeeded:Bool,data:NSData?) -> Void)?) -> Void {
		
		var request = NSMutableURLRequest(URL:url!);
		request.HTTPMethod = "POST";
		request.HTTPBody = data;
		
		self.sendAsyncRequest(request, completionHandler: { (response, d, error) -> Void in
			//			<#code#>
			
			var hasHandler = completionHandler != nil;
			
			if error != nil{
				println("Error posting data: \(error!.localizedDescription)");
				if hasHandler {
					completionHandler!(succeeded:false,data:d!);
				}
				return;
			}
			
			var httpResponse = response as! NSHTTPURLResponse;
			
			if httpResponse.statusCode != 200{
				
				var serverResponse : NSString? = data?.length > 0 ? NSString(data: d!, encoding: NSUTF8StringEncoding) : nil;
				println("Received bad response");
				
				
				if hasHandler {
					completionHandler!(succeeded:false,data:d!);
				}
				return;
			}
			if hasHandler {
				completionHandler!(succeeded:true,data:d!);
			}
		});
	}
}










