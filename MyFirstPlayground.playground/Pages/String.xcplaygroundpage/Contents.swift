//: [Previous](@previous)

import Foundation


//----------------------String 字符串-----------------------------
var str = "Hello, playground"
var str1: String = "Hello, playground"

//空字符串
var emptyString = ""
var emptyString1 = String()
//判断字符串是否为空
emptyString.isEmpty

var str11 = "hello"

//字符串比较(从前向后比较字符)
str11
str
str11 < str

//前缀 后缀
str11
str11.hasPrefix("he")
str11.hasSuffix("lo")

for c in str11.characters {
    print(c)
}

var c1:Character = "!"
//+=一个字符串可以，+=Character不可以
str11 += "!"
str11.append(c1)

//字符串长度
str11
str11.characters.count
//第一个字母大写，不是改变本身的值
str11.capitalized
//全部大写
str11.uppercased()
//全部小写
str11.lowercased()



var string = "Hello-Swift"
//获取某个下标后一个下标对应的字符 char="e"
//swift2.2
//var char = string[startIndex.successor()]
//swift3.0
var char = string[string.index(after: string.startIndex)]
var index = string.index(after: string.index(string.startIndex, offsetBy: 3))
string[index]

//获取某个下标前一个下标对应的字符 char2 = "t"
//swift2.2
//var char2 = string[endIndex.predecessor()]
//swift3.0
var char2 = string[string.index(before: string.endIndex)]
var index1 = string.index(before: string.index(string.startIndex, offsetBy: 5))
string[index1]

//通过范围获取字符串中的一个子串 Hello
//swift2.2
//var subString = string[startIndex...startIndex.advancedBy(4)]
//swift3.0
var subString = string[string.startIndex...string.index(string.startIndex, offsetBy: 4)]
//swift2.2
//var subString2 = string[endIndex.advancedBy(-5)...endIndex.predecessor()]
//swift3.0
var subString2 = string[string.index(string.endIndex, offsetBy: -5)..<string.endIndex]
//获取某个子串在父串中的范围
//swift2.2
//var range =  string.rangeOfString("Hello")
//swift3.0
var range = string.range(of: "Hello")
range?.upperBound
range?.lowerBound

//追加字符串操作 此时string = "Hello-Swift! Hello-World"
//swift2.2
//string.appendContentsOf(" Hello-World")
//swift3.0
string.append(" Hello-World")
//在指定位置插入一个字符 此时string = "Hello-Swift!~ Hello-World"
//swift2.2
//string.insert("~", atIndex: string.startIndex.advancedBy(12))
//swift3.0
string.insert("~", at: string.index(string.startIndex, offsetBy: 12))
//在指定位置插入一组字符 此时string = "Hello-Swift!~~~~ Hello-World"
//swift2.2
//string.insertContentsOf(["~","~","~"], at: string.startIndex.advancedBy(12))
//swift3.0
string.insert(contentsOf: ["~","~","~"], at: string.index(string.startIndex, offsetBy: 12))
//在指定范围替换一个字符串 此时string = "Hi-Swift!~~~~ Hello-World"
//swift2.2
//string.replaceRange(string.startIndex...string.startIndex.advancedBy(4), with: "Hi")
//swift3.0
string.replaceSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 4), with: "Hi")
//在指定位置删除一个字符 此时string = "Hi-Swift!~~~~ Hello-Worl"
//swift2.2
//string.removeAtIndex(string.endIndex.predecessor())
//swift3.0
string.remove(at: string.index(before:string.endIndex))
string

//删除指定范围的字符 此时string = "Swift!~~~~ Hello-Worl"
//swift2.2
//string.removeRange(string.startIndex...string.startIndex.advancedBy(2))
//swift3.0
string.removeSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 2))
var string2 = "My name is Jaki"
//全部转换为大写
//swift2.2
//string2 = string2.uppercaseString
//swift3.0
string2 = string2.uppercased()
//全部转换为小写
//swift2.2
//string2 = string2.lowercaseString
//swift3.0
string2 = string2.lowercased()


