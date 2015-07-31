//
//  ViewController.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/29/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SRWebSocketDelegate {
	
	var webSocket : SRWebSocket?;
	let server = "192.168.1.101:8124";
	
	@IBAction func sendMessage(sender:UIButton!){
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.connectWebSocket()
		// Do any additional setup after loading the view, typically from a nib.
		//println(self.sc!.ready
		//sc.socketio.
		let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
		button.frame = CGRectMake(CGRectGetWidth(view.frame)/2-100, CGRectGetHeight(view.frame)/2-40, 200, 80)
		button.backgroundColor = UIColor(red: 0.2421875, green: 0.64453125, blue: 0.8046875, alpha: 1)
		button.setTitle("Socket.IO", forState: UIControlState.Normal)
		button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), forState: UIControlState.Normal)
		button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), forState: UIControlState.Highlighted)
		button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
		self.view.addSubview(button)
		
	}
	
	func buttonAction(sender:UIButton!) {
		var dict = [
			"name": "test",
			"args": [["Button": "Pressed"]]
		]
		
		/*
		* What you would see in a traditional
		* Socket.IO app.js file.
		*
		* socket.emit("test", {
		*   Button: "Pressed"
		* });
		*
		*
		*/
		
		//		var jsonSendError:NSError?
		//		var jsonSend = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: &jsonSendError)
		//		var jsonString = NSString(data: jsonSend!, encoding: NSUTF8StringEncoding)
		//		println("JSON SENT \(jsonString)")
		//
		//		let str:NSString = "5:::\(jsonString)";
		
		var data = ["id": "msg" , "data": "testing......123",];
		var e  = 	NSErrorPointer();
		var jsonData =	NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted, error: e)//obj: data,);
		
		self.webSocket!.send(jsonData);
		
	}
	
	
	//SWIFT REQUIREMENTS
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	// SWIFT REQUIREMENTS
	
	init() {
		
		super.init(nibName:nil,bundle:nil);//nibName:nil);
		//self.initHandshake()
		//self.connectWebSocket();
	}
	
	func connectWebSocket() {
		
		if self.webSocket != nil{
			//			self.webSocket?.close()
			self.webSocket!.delegate = nil;
			self.webSocket = nil;
		}
		
		
		var _socketio = SRWebSocket(URLRequest: NSURLRequest(URL: NSURL(string: "ws://localhost:8181/call")!));
		_socketio.delegate = self;// as! SRWebSocketDelegate;
		_socketio.open();
		//println("\(socketio!.readyState)");
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func webSocketDidOpen(webSocket: SRWebSocket!) {
		println("webSocketDidOpen");
		self.webSocket = webSocket!;
		var data = ["id": "master" , "sdpOffer":""];
		var e  = 	NSErrorPointer();
		var x =	NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted, error: e)//obj: data,);
		
		self.webSocket?.send(x);
	}
	
	func webSocket(webSocket: SRWebSocket!)  {
		println("webSocket(webSocket: SRWebSocket!");
		self.webSocket = webSocket!;
		var data = ["id": "master" , "sdpOffer":""];
		var e  = 	NSErrorPointer();
		var x =	NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted, error: e)//obj: data,);
		
		self.webSocket?.send(x);
		//self.connectWebSocket();
	}
	
	
	func webSocket(webSocket: SRWebSocket!, didReceivePong pongPayload: NSData!) {
		println(pongPayload);
	}
	func webSocket(webSocket: SRWebSocket!, didReceiveMessage message: AnyObject!) {
		//<#code#>
		println(message);
	}
	
	func webSocket(webSocket: SRWebSocket!, didFailWithError error: NSError!) {
		
		self.connectWebSocket();
	}
	func webSocket(webSocket: SRWebSocket!, didCloseWithCode code: Int, reason: String!, wasClean: Bool) {
		self.webSocket = webSocket!;
		
		//self.webSocket?.close()
		self.connectWebSocket();
	}	
}

