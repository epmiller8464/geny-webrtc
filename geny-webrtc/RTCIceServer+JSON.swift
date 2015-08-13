//
//  RTCIceServer+JSON.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/31/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation

public class RTCICEServerJSON  {
	
	public static let kRTCICEServerUsernameKey :NSString = "username";
	public static let  kRTCICEServerPasswordKey : NSString = "password";
	public static let kRTCICEServerUrisKey :NSString = "uris";
	public static let kRTCICEServerUrlKey :NSString = "urls";
	public static let kRTCICEServerCredentialKey :NSString = "credential";
	
	public static func serverFromJSONDictionary(dict:NSDictionary) -> RTCICEServer {
		
		var url = dict[RTCICEServerJSON.kRTCICEServerUrlKey] as! NSString;
		var username = dict[RTCICEServerJSON.kRTCICEServerUsernameKey] as! NSString ;
		var credential = dict[RTCICEServerJSON.kRTCICEServerCredentialKey] as! NSString;
		
		username = isNilOrEmpty(username) ? username:"";
		credential = isNilOrEmpty(credential) ? credential:"";
		
		return RTCICEServer(URI: NSURL(string: url as String)! , username: username as String, password: credential as String);
	}
	
	public static func serversFromCEODJSONDictionary(dict:NSDictionary) -> NSArray {
		
		var username = dict[RTCICEServerJSON.kRTCICEServerUsernameKey] as! NSString ;
		var password = dict[RTCICEServerJSON.kRTCICEServerPasswordKey] as! NSString;
		
		var uris = dict[RTCICEServerJSON.kRTCICEServerUrisKey] as! NSArray;
		var servers = NSMutableArray(capacity: uris.count);
		
		for uri in uris {
			
			var server = RTCICEServer(URI: NSURL(string: uri as! String)! , username: username as String, password: password as String);
			//			servers.
			servers.addObject(server);
		}
		
		return servers;
	}
	
}