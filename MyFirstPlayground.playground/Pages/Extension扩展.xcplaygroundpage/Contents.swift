//: [Previous](@previous)

import Foundation

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    
    var origin = Point()
    var size = Size()
    
    init(origin:Point , size:Size) {
        self.origin = origin
        self.size = size
    }
    
}
//扩展相当于OC的分类(可以把相关扩展方法分块来写)
extension Rectangle{
    func translate(x:Double , y:Double){
        self.origin.x += x
        self.origin.y += y
    }
}

let rect = Rectangle(origin: Point(), size: Size(width: 4, height: 4))
rect.translate(x: 10, y: 10)
rect

extension Rectangle{
    //一下报错，不能扩展存储型属性，只能扩展计算型属性
//    var center: Point = Point()
    var center: Point {
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        
        set{
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
    
    //扩展中也可以扩展新的构造函数(扩展中的构造函数必须引用指定构造函数（self.init），故需要convenience关键字，指定构造函数不能写在扩展中，只能在原生类里)
    convenience init(center:Point , size:Size) {
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        
        self.init(origin: Point(x:originX , y:originY) , size: size)
    }
}
rect.center




		