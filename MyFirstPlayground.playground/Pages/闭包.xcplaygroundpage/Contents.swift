//: [Previous](@previous)

import UIKit

//闭包基本和Block,Lambda,匿名函数一样

var arr:[Int] = []
for _ in 0 ..< 100 {
    arr.append(Int(arc4random()%1000))
}
func biggerNumberFirst(a:Int , _ b:Int) -> Bool{
    return a > b
}
arr.sort(by: biggerNumberFirst)
arr
//以上需要定义个biggerNumberFirst函数，浪费时间， 闭包相当于匿名函数，不需要函数名
//sorted返回新数组，不改变原数组；sort改变原数组
arr.sorted(by: {(a:Int , b:Int) -> Bool in
    return a < b
})

arr.sorted(by: {(a:Int , b:Int) -> Bool in return a < b})

arr.sorted(by: {a , b in return a < b})

arr.sorted(by: {a , b in a < b})
//默认两个参数名字 $0,$1 类型是Int 返回值用$0 < $1表达式表示出来了
arr.sorted(by:{$0 < $1})
//运算符本身就是个函数
arr.sorted(by: < )


//trailing closure风格
arr.sorted(){a , b in return a < b}
arr.sorted{a , b in return a < b}

arr.map{(number) -> String in
    var number = number
    var res = ""
    repeat{
        res = String(number%2) + res
        number /= 2
    }while number != 0
    return res
}
arr








