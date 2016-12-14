//: [Previous](@previous)

import UIKit

class Person{
    var name = "DNCoder"
    init(name: String) {
        self.name = name
    }
}

//Swift可以自动判断类型。这里的数组若不显式声明类型，默认元素类型是Any类型，相当于OC的id类型。
//还有个类型是AnyObject类型，和Any类似，不过AnyObject是一个对象，Any的范围更广，还可以是一段逻辑
var objects: [AnyObject] = [
    //值类型的数据需要转化成AnyObject对象
    CGFloat(3.1415926) as AnyObject,
    "abc" as AnyObject,
    
    UIColor.red,
    NSDate(),
    Person(name: "DNCoder")
]

var objs = ["a", 123, NSDate()] as [Any]


let a = objects[0]

//Swif是面向函数的语言，函数是一等公民，可看做为对象，参数，返回值..
//这里会报错，因为数组元素类型是AnyObject只能是对象，不能是函数，函数是个过程
objects.append({ (a:Int) -> Int in
    return a*a
} as AnyObject)//这里的函数被强转为对象就可以存数组了
//如果数组元素是Any类型，就不需要as AnyObject强转了
