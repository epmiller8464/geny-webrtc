//
//  RTCMediaConstraints+JSON.swift
//  geny-webrtc
//
//  Created by ghostmac on 8/4/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation



public extension RTCMediaConstraints {
 	public func constraintsFromJSONDictionary(dictionary:NSDictionary) -> RTCMediaConstraints{
		
		var mandatory = dictionary[Utitlity.kRTCMediaConstraintsMandatoryKey] as! NSDictionary;
		var mandatoryConstraints = NSMutableArray(capacity:mandatory.count);
		
		for  kvp in mandatory{
			var pair = RTCPair(key:kvp.key.value,value:kvp.value.value);
			mandatoryConstraints.addObject(pair);
		}
		return RTCMediaConstraints(mandatoryConstraints: mandatoryConstraints as [AnyObject], optionalConstraints: nil);
	}
	
}