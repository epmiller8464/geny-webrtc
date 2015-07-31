//: Playground - noun: a place where people can play

import Cocoa
var str = "Hello, playground"

for count in 0...100 {
	sin(1000.0 / Double(count))
	
}


protocol CEODTurnClient {
	
	//“let completionBlock: (NSData, NSError) -> Void = {data, error in /* ... */}”
	
	func initWithUrl(url:NSURL) -> Self;
	
}

public class TurnClientDelegate :  NSObject , CEODTurnClient{
	
	public var TypeName :String?;
	init(name:String?){
		self.TypeName = name;
	}
	public func initWithUrl(url: NSURL) -> Self {
		return self;
	}
}

var tcDel = TurnClientDelegate(name: "tcdhoe");

tcDel.initWithUrl(NSURL(string: "ws://localhost:8181/call")!).TypeName;


isNilOrEmpty("");
isNilOrEmpty("s");



var s :NSString = "s";
s is String
var s2 : String =  s as String;

s2 is NSString;//is NSString
count("👍".utf16);

count("👍");// is NSString



