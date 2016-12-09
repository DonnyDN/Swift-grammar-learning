//: [Previous](@previous)

import UIKit

extension Int{
    var square: Int{
        return self * self
    }
    var cube: Int{
        return self * self * self
    }
    
    func inRange(closedLeft left: Int , openedRight:Int) -> Bool {
        return self >= left && self < openedRight
    }
    
    //闭包作为参数
    func repetitions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
//    func stride(to end:Int, stride1:Int, task:(Int) -> Void) {
//        for i in stride(from: self, to: end, by: stride1) {
//            task()
//        }
//    }
}

let num = 8
num * num
num.square
num.cube
num.inRange(closedLeft: 0, openedRight: 10)
num.repetitions { 
    print("Hello")
}

for i in stride(from: 2, to: num, by: 2){
    print(i)
}




		