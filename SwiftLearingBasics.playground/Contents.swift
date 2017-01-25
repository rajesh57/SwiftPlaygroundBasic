//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//***********************************************************************************
// -------   let vs. var  ---------------
/*
 The word var is used to define a variable,
 the word let is used to define a constant. Once you define a constant, you cannot change the value.
 */
//***********************************************************************************

let firstName = "Rajesh"

 //firstName = "Kumar" its gives to error
var lastName = "Kumar"
lastName = "RajeshKumar"


//***********************************************************************************
// ------- Optionals ---------------
/*
 A variable may or may not have a value assigned to it.
 */

var mySal: Int?
mySal = 100;
print(mySal as Any )

var myStringName :String?

myStringName = "RAJESH"
if myStringName != nil{
    print(myStringName!)
} else {
    print("myStringName nil value")
    print("test===:\(myStringName)")
    
}

// ------- Optional Binding ---------------
/*
You can find out whether an optional contains a value and, if so, assign a temporary constant or variable to that value in a single action.
 */

// Optional Binding Syntax to a Constant

let optionalName : String? = "Hey there"
if let constantName = optionalName {
    print("constant contains value=== :\(constantName)")
}

// Optional Binding Syntax to a Variable

let  optionalName1 : String? = "Good morning"
if var varName = optionalName1 {
    print("variable contains values===:\(varName)")
}

// ------- Implicitly Unwrapped Optionals ---------------
/*
 -> There are instances variable - optional will always have a value.
 
 -> In these instances, it’s useful to remove the need to check and unwrap an optional every time it needs to be accessed. These kinds of optionals are called implicitly unwrapped optionals.
 
 -> If you think a value should never be nil, force unwrap it, as it will provide a nil check during the runtime.
 */

var optionalValue : String? = "Test optional"  //(this str may or may not have value)
var forcedUnwarppedStr = optionalValue! // (requires an ! )

var optionalTest : String! = "An implicitly unwrapped optional" // This value cannot be nil at any time - if it is nil CRASH happens
var implicitUnwarppedStr = optionalTest // no need for an !

// Technically, all initializers from classes that inherit from NSObject return Implicitly Unwrapped Optionals. This is because initialization in Objective-C can return nil .That means, in some cases, that you will still want to be able to test the result of initialization for nil. A perfect example of this is with UIImage if the image does not exist:

var image : UIImage? = UIImage(named: "NonExistentImage")
if image != nil {
    print("image exists")
}
else {
    print("image does not exist")
}


//***********************************************************************************
// ------- Understanding Collections - Arrays and Dictionary ---------------
/*
An array is an ordered collection, which means that objects are entered in an array in a certain order and retrieved in the same order.
 */
//Accessing Objects in an Array
var testArray : [String] = ["One","Two","Three"]

print(testArray[0])

var arrayCount = testArray.count

//Adding Objects to an Array
testArray.append("Four")

//Adding Multiple Objects to an Array
var myArray: [String] = ["One", "Two", "Three"]
myArray += ["Four", "Five", "Six"]

//Adding a String to the Beginning of an Array
myArray.insert("One", at: 0)

// Fast Enumeration
for var myStr in myArray {
    print(myStr)
}

//Removing an Object
myArray.remove(at: 1)

 // ---  Dictionary -------
/*
 Dictionary contains Key pair value
 */
    //Varname   [Key : value]
var testDict : [String:String] = ["firstName":"Rajesh","lastName":"Kumar"]

// Empty Dict Declation 
var emptyDict = [String: String]()

//***********************************************************************************
 //NOTE 1:  func methodName() -> String
 //This is how a Swift function is defined. The word methodName, of course, can represent any name. The word String can also change. It represents what type of information the method returns.

// NOTE 2: Even though in Swift a single file may contain many different classes, a programmer will want to separate the code into different files to make access easier.
// Ex :

import Foundation
class testHelloWorld {
    func testMethod() -> String {
         let myStr = "Test Hello world by Rajesh"
        print("My string=== ,\(myStr)")
        return myStr
    }
}

// Call class function
let myTestHelloWorld = testHelloWorld()
myTestHelloWorld.testMethod()
