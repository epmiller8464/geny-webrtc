////
////  SocketChannel.swift
////  geny-webrtc
////
////  Created by ghostmac on 7/29/15.
////  Copyright (c) 2015 ghostmac. All rights reserved.
////
//
//import Foundation
//
//public class SocketChannel: NSObject, SRWebSocketDelegate {
//	var socketio:SRWebSocket?
//	let server = "192.168.1.101:8124" // don't include http://
//	let session:NSURLSession?
//	
//	override init() {
//		
//		let sessionConfig:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration();
//		sessionConfig.allowsCellularAccess = true;
//		sessionConfig.HTTPAdditionalHeaders = ["Content-Type": "application/json"];
//		sessionConfig.timeoutIntervalForRequest = 30;
//		sessionConfig.timeoutIntervalForResource = 60;
//		sessionConfig.HTTPMaximumConnectionsPerHost = 1;
//		
//		session = NSURLSession(configuration: sessionConfig);
//		super.init();
//		self.initHandshake();
//	}
//	
//	func initHandshake() {
//		let time:NSTimeInterval = NSDate().timeIntervalSince1970 * 1000
//		
//		//		var endpoint = NSURL(string:"http://\(server)/socket.io/1?t=\(time)")!;
//		var endpoint = NSURL(string:"http://\(server)/")!;
//		var handshakeTask = session!.dataTaskWithURL(endpoint, completionHandler:
//			{
//				(data:NSData!, response:NSURLResponse!, error:NSError!) in
//				println("error\(error) data:\(data) res:\(response)");
//				if error == nil
//				{
//					let stringData:NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
//					let handshakeToken:NSString = stringData.componentsSeparatedByString(":")[0] as! NSString
//					println("HANDSHAKE \(handshakeToken)")
//					
//					self.socketConnect(handshakeToken);
//
//				}
//				else
//				{
//					
//					println(error!);
//				}
//		});
//		handshakeTask.resume()
//	}
//	
//	func socketConnect(token:NSString)  -> Void {
//		println(token);
//		self.socketio = SRWebSocket(URLRequest: NSURLRequest(URL: NSURL(string: "http://\(server)/")!));
//		self.socketio!.delegate = self;
//		self.socketio!.open();
//	}
//	
//	public func webSocket(webSocket: SRWebSocket!, didReceiveMessage message: AnyObject!) {
//		// All incoming messages ( socket.on() ) are received in this function. Parsed with JSON
//		println("MESSAGE: \(message)")
//		
//		var jsonError:NSError?
//		let messageArray = (message as! NSString).componentsSeparatedByString(":::")
//		let data:NSData = messageArray[messageArray.endIndex - 1].dataUsingEncoding(NSUTF8StringEncoding)!
//		var json:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError)
//		
//		if json != nil {
//			let event: NSString = json!["name"] as! NSString
//			let args: NSDictionary = (json!["args"] as! NSArray)[0] as! NSDictionary
//			
//			if (event.isEqualToString("one")) {
//				didReceiveEventOne(args)
//			}
//			else if (event.isEqualToString("two")) {
//				didReceiveEventTwo(args)
//			}
//			else if (event.isEqualToString("three")) {
//				didReceiveEventThree(args)
//			}
//		}
//	}
//	
//	func didReceiveEventOne(args: NSDictionary) {
//		var dict = [
//			"name": "event",
//			"args": [["Method": "One"]]
//		]
//		var jsonSendError:NSError?
//		var jsonSend = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: &jsonSendError)
//		var jsonString = NSString(data: jsonSend!, encoding: NSUTF8StringEncoding)!
//		println("JSON SENT \(jsonString)")
//		let str:NSString = "5:::\(jsonString)"
//		socketio?.send(str)
//	}
//	
//	func didReceiveEventTwo(args: NSDictionary) {
//		var dict = [
//			"name": "event",
//			"args": [["Method": "Two"]]
//		]
//		var jsonSendError:NSError?
//		var jsonSend = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: &jsonSendError)
//		var jsonString = NSString(data: jsonSend!, encoding: NSUTF8StringEncoding)
//		println("JSON SENT \(jsonString)")
//		let str:NSString = "5:::\(jsonString)"
//		socketio?.send(str)
//	}
//	
//	func didReceiveEventThree(args: NSDictionary) {
//		var dict = [
//			"name": "event",
//			"args": [["Method": "Three"]]
//		]
//		var jsonSendError:NSError?
//		var jsonSend = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: &jsonSendError)
//		var jsonString = NSString(data: jsonSend!, encoding: NSUTF8StringEncoding)
//		println("JSON SENT \(jsonString)")
//		let str:NSString = "5:::\(jsonString)"
//		socketio?.send(str)
//	}
//	
//	
//}