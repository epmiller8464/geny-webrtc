//
//  RTCAppClient.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/29/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation;
import CoreData;


enum RTCAppClientState : Int{
	case kARDAppClientStateDisconnected ,kARDAppClientStateConnecting,kARDAppClientStateConnected
	// Connecting to servers.
	//	case ;
	// Connected to servers.
	//	case ;
	
}

protocol RTCAppClientDelegate : AnyObject {
	
	//func appClient(RTCAppClient
	
	
}


protocol RTCAppClientProtocol: AnyObject {
	
	var state : RTCAppClientState {get}
	
	var delegate: RTCAppClientDelegate {get set}
	
	init(delegate:RTCAppClientDelegate );
	
	func connectToRoomWithId(roomId:NSString,options:NSDictionary) -> Void;
	
	func disconnect();
}
