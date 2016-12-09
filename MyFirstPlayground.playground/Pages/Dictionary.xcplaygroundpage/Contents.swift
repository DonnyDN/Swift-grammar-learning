//: [Previous](@previous)

import Foundation

var dict: [String : String] = ["swift":"雨燕", "python":"大蟒","java":"爪哇岛","groovy":"绝妙时髦的"]

var dict1 = ["swift":"雨燕", "python":"大蟒","java":"爪哇岛","groovy":"绝妙时髦的"]

var dict2:Dictionary <String,String> = ["swift":"雨燕", "python":"大蟒","java":"爪哇岛","groovy":"绝妙时髦的"]

//空字典
var emptyDict:[String:Int] = [:]
var emptyDict1:Dictionary<String,Int> = [:]
var emptyDict2 = [String:String]()
var emptyDict3 = Dictionary<Int,Int>()


//用法
dict["swift"]

print(dict["swift"])//dict["swift"]可能为空

dict.count
dict.isEmpty
emptyDict.isEmpty

//强制转换成数组
Array(dict.keys)
Array(dict.values)

for key in dict.keys {
    print(key)
}

for (key , value) in dict{
    print("\(key):\(value)")
}


let dic1 = [1:"A",2:"B",3:"C"]
let dic2 = [1:"A",3:"C",2:"B"]

if dic1 == dic2 {
    print("相等")
}
//修改键值
dict["swift"] = "迅速雨燕"
dict
//updateValue函数会返回更改前的value
let oldValue = dict.updateValue("超级迅速雨燕", forKey: "swift")
oldValue
dict

if let oldValue = oldValue ,let newValue = dict["swift"] , oldValue == newValue{
    print("未更改")
}

//增加键值对
dict["addKey"] = "addvalue"
dict

dict.updateValue("addvalue1", forKey: "addKey1")
dict

//删除键值对,removeValue返回可选型，因为key对应的value可能不存在
dict.removeValue(forKey: "groovy")
dict

if let java = dict.removeValue(forKey: "java") {
    print("有java的value")
}

dict.removeAll()



