//: Playground - noun: a place where people can play

import UIKit

//---------------------------BOOL-----------------------------
let imtrueVar = true
let imfalse = false

if imtrueVar{
    print("I'm true!",terminator:"")
}

if (imfalse){//if后可加（），控制优先级
    print("I'm false!",terminator:"")
}
else if 0+2==2{
    print("0+2=2",terminator:"")
}

let a:Int = 1
//if a {} 这会报错，在Swift中非0的值，不会定义成真！判断条件要么是BOOL值，要么是表达式。



