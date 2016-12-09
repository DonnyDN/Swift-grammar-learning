//: [Previous](@previous)

import Foundation


//---------------------------元组(Tuple)-----------------------------
/*
 有序，可存不同类型
 */
let registration = (true, "少年派", "男")
let loginResule:(Bool, String, NSInteger) = (true, "元组", 23)
//声明元组时候，也可以给元素起一个别名
let regist:(Bool, String, NSInteger) = (isRegis:false, name:"路飞", age:20)

registration.0
registration.1
registration.2

regist.0
regist.1
regist.2

//把元组的元素，分别赋值给新创建的变量,使用下划线（_）忽略部分数值
var (isRegisted, nickName, _) = registration
isRegisted
nickName
//gender


//元组声明时就定义类型的话，这样用别名访问会报错
//regist.isRegis
//isRegis