//
//  TurnClient.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/30/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation

protocol TurnClientProtocol : AnyObject{
	//“let completionBlock: (NSData, NSError) -> Void = {data, error in /* ... */}”
	func requestServersWithCompletionHandler(completionHandler: (turnServers : NSArray?, error:NSError?) -> Void);
}

protocol CEODTurnClientProtocol : TurnClientProtocol, AnyObject {
	
	//“let completionBlock: (NSData, NSError) -> Void = {data, error in /* ... */}”
	init?(url:NSURL?);
}


public class TurnClient : CEODTurnClientProtocol, AnyObject{
	static var kTURNOriginURLString : String = "https://apprtc.appspot.com";
	static var kARDCEODTURNClientErrorDomain : String = "ARDCEODTURNClient";
	static var kARDCEODTURNClientErrorBadResponse : Int = 1;
	
	var url : NSURL?;
	public required init?(url: NSURL?) {
				self.url = url;
		if nil == self.url || self.url!.absoluteString?.length() > 0 {
			//
			return nil;
		}
		
	}
	public func requestServersWithCompletionHandler(completionHandler: (turnServers: NSArray?,error: NSError?) -> Void) {
		//code
		
		var request = NSMutableURLRequest(URL:self.url!);
		request.addValue("Mozilla/5.0", forHTTPHeaderField: "user-agent");
		request.addValue(TurnClient.kTURNOriginURLString, forHTTPHeaderField: "user-agent");
		//		NSURLConnection.sendAsyncPostToURL(request:request)
		var c = NSURLConnection();
		
		NSURLConnection().sendAsyncRequest(request,
			completionHandler:{
				(response:NSURLResponse?, data:NSData?,error: NSError?) -> Void in
				
				var turnServers = NSArray();
				if error == nil {
					completionHandler(turnServers:turnServers, error: error);
					return;
				}
				
				var data =	NSDictionary().dictionaryWithJSONData(data!);
				turnServers = RTCICEServerJSON.serversFromCEODJSONDictionary(data);
				var e =  NSError(domain:TurnClient.kARDCEODTURNClientErrorDomain, code:TurnClient.kARDCEODTURNClientErrorBadResponse,userInfo: [NSLocalizedDescriptionKey: "bad request fool"]);
				if 0 == turnServers.count {
					completionHandler(turnServers: turnServers, error:e);
					return;
				}
				completionHandler(turnServers: turnServers, error: nil);
		});
	}
	

}
