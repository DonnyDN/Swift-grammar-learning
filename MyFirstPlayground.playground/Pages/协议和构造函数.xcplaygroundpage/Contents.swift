//: [Previous](@previous)

import Foundation

protocol Pet{
    
    var name: String{get set}
    
    //协议也可以定义构造函数,遵从者需要实现
    init(name: String)
    
    func playWith()
    func fed()
}

class Animal{
    
    var type: String = "mammal"
    
}
//继承的父类（仅一个）放在前，实现的协议（可多个）放最后
class Dog: Animal, Pet{
    
    var name: String = "Puppy"
    
    //关键字required要求子类继承本Dog类的话，子类当然也继承Pet协议，也需要实现此init方法
    //当然此类若final class Dog..也就不需有required，因为没有子类
    required init(name: String) {
        self.name = name
    }
    func playWith() {
        print("🐶")
    }
    
    func fed() {
        print("I love bones")
    }
}



class Bird: Animal{
    
    var name = "little little bird"
    
    init(name: String) {
        self.name = name
    }
    
    
}

class Parrot: Bird, Pet{
    
    required override init(name: String) {
        super.init(name: name + " " + name)
    }
    
    func playWith() {
        print("hello")
    }
    
    func fed() {
        print("Thank you")
    }
}

//-------------关联类型associatedtype---------------------
protocol WeightCaculate{
    //associatedtype 和 typealias一样，都是别名的意思，在这里需要使用associatedtype，用typealias会报警告
    //关键字associatedtype 顾名思义关联类型
    //协议关联一个类型，可以大大增加协议的灵活性
    associatedtype WeightType
    
    var weight: WeightType { get }
}

//iPhone7的重量0.114g
class iPhone7: WeightCaculate{
    
    typealias WeightType = Double
    
    var weight: WeightType{
        return 0.114
    }
    
}

//Ship船的重量
class Ship: WeightCaculate{
    
    typealias WeightType = Int
    
    let weight: WeightType
    
    init(weight: WeightType) {
        self.weight = weight
    }
}

extension Int{
    typealias Weight = Int
    var t: Weight{
        return 1_000*self
    }
    
}
let titanic = Ship(weight: 46_328.t)


//-------------常用协议---------------------
/**
 Equatable: 遵从此协议，必须对”==“运算符进行重载（写在外面，必须紧跟着此对象定义），来保证此对象可以进行 == 比较;
 Comparable:遵从此协议，必须对”<“运算符进行重载（写在外面，必须紧跟着此对象定义），来保证此对象可以进行大小比较
 CustomStringConvertible:自定义Printf打印的字符串，需要在对象定义内部覆盖description属性；
 
 */
struct Record: Equatable, Comparable, CustomStringConvertible{
    
    var wins:Int
    var losses: Int
    
    var description: String{
        return "WINS: " + String(wins) + " , LOSSES: " + String(losses)
    }
    
}
func == (left: Record, right: Record) -> Bool{
    return left.wins == right.wins && left.losses == right.losses
}
func < (left: Record, right: Record) -> Bool{
    if left.wins != right.wins {
        return left.wins < right.wins
    }
    return left.losses > right.losses//(输的次数多，record就小)
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

//遵循此Equatable协议的好处是，重载一个”==“运算符，系统也自动重载了”!=“这一运算符
recordA != recordB
//遵循此Equatable协议的好处是，重载一个”<“运算符，系统也自动重载了”> >= <=“这些运算符
recordA < recordB
recordA > recordB
recordA <= recordB
recordA >= recordB

var team1Record = Record(wins: 10, losses: 3)
var team2Record = Record(wins: 8, losses: 5)
var team3Record = Record(wins: 8, losses: 8)
var records = [team1Record, team2Record, team3Record]

records.sort()//按从小到大"<"排列，前提是records数组内存储的对象是可比较的，也就是实现Comparable协议了;或者重载过<运算符,这样records.sorted(by: <)
records.sorted(by: <)

print(recordA)









