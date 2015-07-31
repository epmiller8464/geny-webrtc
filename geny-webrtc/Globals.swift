//
//  Globals.swift
//  geny-webrtc
//
//  Created by ghostmac on 7/31/15.
//  Copyright (c) 2015 ghostmac. All rights reserved.
//

import Foundation

public func isNilOrEmpty(str:NSString?) -> Bool{
	//	str!.containsString(str);
	if	let nsString : NSString = str as NSString?{
		return nsString.length == 0;
	}
	return true;
}
