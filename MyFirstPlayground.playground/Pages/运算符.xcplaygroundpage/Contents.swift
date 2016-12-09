//: [Previous](@previous)

import Foundation

//---------------------------运算符-----------------------------
//Swift中表达式无返回值，以下报错
//if(2-1) {}

Int.max
//数据溢出错误
//Int.max+1

//a === b

//a !== b


//a & b

//a | b

//----------Nil Coalescing Operator 聚合运算符(针对可选型设计的)-------------

var username:String?

username = "路飞"
//username ?? "Guest" ---->(条件运算符)username != nil ? username : "Guest"
let outputName:String = username ?? "Guest"

print("hello," + outputName)


//----------------------Range Operator 区间运算符-----------------------------
//闭区间 [a, b] --> a...b

//前闭后开 [a, b) --> a..<b

let array = ["1","2","3","4"]

for index in 0..<array.count
{
    print(index)
}
