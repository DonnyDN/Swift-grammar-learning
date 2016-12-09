//: [Previous](@previous)

import Foundation
//结构体基础定义---(值类型 赋值即是copy)---------------
//Array,Dictionary,Set 是结构体
//Int,Float,Double,Bool,String都是结构体
struct Location{
    let latitude: Double
    let longitude: Double
}
struct Location1{
    var latitude: Double = 0//赋初值
    var longitude: Double = 0
}
var a:Location = Location(latitude: 11, longitude: 11)
let b:Location = Location(latitude: 22, longitude: 22)

a.latitude
a.longitude
a = b //虽然结构体中参数类型是let，但是整个结构体是var 故参数也是var了
//a.latitude = 33 但直接改变结构体的let参数不可以
a.latitude
a.longitude

//结构体嵌套结构体------------------
struct Place{
    let lcoation: Location
    var name: String
}
var c = Place(lcoation: a, name: "a")
c.lcoation.latitude

//结构体构造函数------------------
struct Location2{
    let latitude: Double
    let longitude: Double
    var placeName: String?//可选型默认初值nil
    //创建方法1
    init(coordicateString: String) {
        let index = coordicateString.range(of: ",")!.lowerBound
        let firstElement = coordicateString.substring(to: index)
        let secondElement = coordicateString.substring(from: coordicateString.index(after: index))
        
        latitude = Double(firstElement)!
        longitude = Double(secondElement)!
    }
    //创建方法2
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

let local = Location2(coordicateString: "44,55")

let local1 = Location2(latitude:2, longitude:3)

let A = Set<Int>()//集合 实际是个构造函数
let B = Int()
let C = Int(1.2)//强制类型转换 实际是个构造函数
let D = [Int](repeatElement(0, count: 3))//数组构造 实际是个构造函数

//结构体构造函数错误处理优化------------------
struct Location3{
    let latitude: Double
    let longitude: Double
    var placeName: String?//可选型默认初值nil
    
    //创建方法1 Failable-Initializer(可失败)
    init?(coordicateString: String) {
        guard
            let index = coordicateString.range(of: ",")?.lowerBound,//逗号
            let firstElement = Double(coordicateString.substring(to: index)),
            let secondElement = Double(coordicateString.substring(from: coordicateString.index(after: index)))
        else {
            return nil
        }
        
        latitude = firstElement
        longitude = secondElement
    }
    //创建方法2
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func printLocation() {
        print("The Location is \(self.latitude),\(self.longitude)")
    }
    //是不是北半球
    func isNorth() -> Bool {
        return self.latitude > 0
    }
    
    func isSouth() -> Bool {
//        return !self.isNorth()//self.可省略
        return !isNorth()
    }
    //经纬度计算两点距离
    func distanceTo(location:Location) -> Double {
        return sqrt(pow(self.latitude - location.latitude, 2)) + pow(self.longitude - location.longitude, 2)
    }
}

struct Location5{
    var x = 0
    var y = 0
    
    mutating func goEast(){//mutating 改变自己
        self.x += 2
    }
}

var loc = Location5(x: 1, y: 1)

loc.goEast()
loc.x



		