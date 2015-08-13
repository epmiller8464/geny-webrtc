//
//  RTCIceCandidate+JSON.swift
//  geny-webrtc
//
//  Created by ghostmac on 8/3/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation

public class RTCIceCandidateHeler{
	
	public static let  kRTCICECandidateTypeKey : NSString = "type";
	public static let  kRTCICECandidateTypeValue : NSString = "candidate";
	public static let  kRTCICECandidateMidKey : NSString = "id";
	public static let  kRTCICECandidateMLineIndexKey : NSString = "label";
	public static let  kRTCICECandidateSdpKey : NSString = "candidate";
}

public extension RTCICECandidate {
	
	
	
	public static func candidateFromJSONDictionary(dictionary: NSDictionary) -> RTCICECandidate {
		
		var mid = dictionary[RTCIceCandidateHeler.kRTCICECandidateMidKey] as! String?;
		var sdp = dictionary[RTCIceCandidateHeler.kRTCICECandidateSdpKey] as! String?;
		var num = dictionary[RTCIceCandidateHeler.kRTCICECandidateMLineIndexKey] as! String?;
		var mLineIndex = num?.toInt();
		
		return RTCICECandidate(mid: mid!, index: mLineIndex!, sdp: sdp!);
	}
	
	
	public func JSONData() -> NSData? {
		
		var json  :NSDictionary = [RTCIceCandidateHeler.kRTCICECandidateTypeKey : RTCIceCandidateHeler.kRTCICECandidateTypeValue,
			RTCIceCandidateHeler.kRTCICECandidateMLineIndexKey : self.sdpMLineIndex,
			RTCIceCandidateHeler.kRTCICECandidateMidKey : self.sdpMid,
			RTCIceCandidateHeler.kRTCICECandidateSdpKey : self.sdp];
		var error : NSErrorPointer? = nil;
		var data = NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions.PrettyPrinted, error: error!);
		
		if error != nil{
			println(error!);
			return nil;
		}
		
		return data!;
		
	}
}