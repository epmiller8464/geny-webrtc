//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to webrtc-pg.playground.
//

//import ViewController
import Foundation

public func isNilOrEmpty(str:NSString?) -> Bool{
	
	if	let nsString : NSString = str as NSString?{
		return nsString.length == 0;
	}
	return true;
}