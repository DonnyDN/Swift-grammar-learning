//: [Previous](@previous)

import UIKit
import XCPlayground
import PlaygroundSupport

let showView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
showView.backgroundColor = UIColor.yellow

let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
rectangle.center = showView.center
rectangle.backgroundColor = UIColor.red

showView.addSubview(rectangle)
//UIView.animate(withDuration: 2, animations: <#T##() -> Void#>)
//UIView.animate(withDuration: 2, animations: {
//    rectangle.frame = showView.frame
//    rectangle.backgroundColor = UIColor.blue
//})

//闭包部分在尾部，可以提到外边，参数名可以省略了
UIView.animate(withDuration: 2) {
    rectangle.frame = showView.frame
    rectangle.backgroundColor = UIColor.blue
}
PlaygroundPage.current.liveView = showView



//--------------闭包的内容捕获----------------

var arr:[Int] = []
for _ in 0..<20 {
    arr.append(Int(arc4random()%20))
}

arr.sorted(){a,b in
    abs(a-10) < abs(b-10)
}

var num = 10
arr.sorted(){a,b in
    abs(a-num) > abs(b-num)//闭包引用外部变量，称内容捕获，函数做不到
}

//--------------闭包和函数式引用类型，字典数组是值类型----------------
//此函数返回一个无参有返回Int的闭包，闭包捕获了此函数中的变量和参数用来返回值
func runningMetersWithMetersPerDay(metersPerDay: Int) -> (() -> Int){
    var totalMeters = 0
    return{
        totalMeters += metersPerDay//totalMeters,metersPerDay都不是在此闭包中定义的，皆内容捕获
        return totalMeters
    }
}
var planA      = runningMetersWithMetersPerDay(metersPerDay: 2000)
var planAValue = runningMetersWithMetersPerDay(metersPerDay: 2000)()
planA()
planA()
planA()

planAValue

var planB = runningMetersWithMetersPerDay(metersPerDay: 5000)
planB()
planB()

var anotherPlan = planB
anotherPlan()

planB()//证明了引用类型

//let表示planC不能重新赋值，指针地址不可变
let planC = runningMetersWithMetersPerDay(metersPerDay: 3000)
planC()
planC()
//planC = runningMetersWithMetersPerDay(metersPerDay: 1000)//报错


