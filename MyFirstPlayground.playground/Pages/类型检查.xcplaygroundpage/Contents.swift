//: [Previous](@previous)

import UIKit

//关键字is，和OC中isKindOf类似

protocol Shape{
    var name: String{get}
}
protocol HasArea{
    func area() -> Double
}

struct Point: Shape{
    let name: String = "point"
    var x   : Double
    var y   : Double
}

struct Line: Shape{
    let name: String = "line"
    var a   : Point
    var b   : Point
}

struct Rectangle: Shape, HasArea{
    let name  : String = "rectangle"
    var origin: Point
    var width : Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
}

struct Circle: Shape, HasArea{
    let name  : String = "circle"
    var center: Point
    var radius: Double
    
    func area() -> Double {
        return M_PI * radius * radius
    }
}
//[Shape] Shape是个协议，可看做一个类型
let shapes: [Shape] = [
    Rectangle(origin: Point(x: 0, y: 0), width: 3, height: 4),
    Point(x: 0, y: 0),
    Circle(center: Point(x: 0, y: 0), radius: 1),
    Line(a: Point(x: 1, y: 1), b: Point(x: 5, y: 5))
]

for shape in shapes {
    if shape is HasArea {
        print("\(shape.name) has area.")
    } else {
        print("\(shape.name) has no area")
    }
}

print("================")
for shape in shapes {
    
//    shape.area() 这句调用会报错，因为要把shape转化成HasArea类型的才有计算面积方法area()
    //下面as？是尝试强制类型转换，shape若遵守HasArea协议，就会被转换成HasArea类型的，就可以调用area()
    if let areaShape = shape as? HasArea {
        print("The area of \(shape.name) is \(areaShape.area())")
    }else{
        print("\(shape.name) has no area")
    }
}

/*
 总结：可以用is，as对协议的遵守情况进行判断，并且进行这种类型的转换
 */


print("================")

class MediaItem{}

class Movie: MediaItem{}

class Music: MediaItem{}

class Game: MediaItem{}

let library:[MediaItem] = [Movie(), Music(), Game()]

//这里的as意思是【尝试强制类型转换】，需要用可选，因为不一定转换成功，library[0]不一定有值，有值也不定是Movie类型
let item0 = library[0] as? Movie

item0 is Movie?

