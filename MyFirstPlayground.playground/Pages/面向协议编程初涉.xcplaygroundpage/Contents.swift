//: [Previous](@previous)

import Foundation

/**
 swift标准库中：
    Classes :6
    Enum    :8
    Structs :103
    Protocol:86
 
 结构体不需要像类一样考虑继承关系；
 像一些基本类型：整型、浮点型、字符串、数组、字典..相互之前不需要什么继承关系
 swift标准库重度依赖结构，也就依赖协议来共同完善结构中的不同属性；协议被继承不仅仅局限在类class，还可以是任意类型
 由于如此依赖协议，故Swift被称为面向协议的预言
 */

//协议可以继承
protocol Record: CustomStringConvertible{
    
    var wins: Int {get}
    var losses: Int {get}
    
//    func winningPercent() -> Double
    
    //报错
//    var description: String{
//        return String(format: "WINS: %d , LOSSES: %d", wins, losses)
//    }
}

//在协议的扩展中可以添加具体的逻辑（也称协议的默认实现方式），使控制非常灵活，最大限度实现代码复用
extension Record{
    //description属性不能在上面原始Record定义中实现，但是竟然可以扩展协议！
    var description: String{
        return String(format: "WINS: %d , LOSSES: %d", wins, losses)
    }
    
    //按说原始Record定义中的方法，继承者需要实现，但是扩展的协议中，竟然已经实现好了。继承者不需要再次实现了
    func shoutWins() {
        print("WE WIN",wins,"TIMES!")
    }
    
    var gamePlayedCount: Int{
        return wins + losses
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayedCount)
    }
}

protocol Tieable{//可平局
    var ties: Int {set get}
}

protocol Prizable{//可被奖励
    func isPrizable() -> Bool
}

//where 进行条件判断，扩展实现了Tieable的Record协议，Self是大写的表示他自己的类型，遵守Record协议的一个类型，与此同时此类型也遵守Tieable协议
extension Record where Self: Tieable{
    var gamePlayedCount: Int{
        //Record协议中有wins、losses,Tieable中有ties
        return wins + losses + ties
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(wins + losses + ties)
    }
}

struct BasketballRecord: Record, Prizable{
    
    var wins: Int
    var losses: Int
    
//    func winningPercent() -> Double {
//        return Double(wins) / Double(gamePlayedCount)
//    }
    
    //这个重写就不需要了
//    var description: String{
//        return String(format: "WINS: %d , LOSSES: %d", wins, losses)
//    }
    func isPrizable() -> Bool {
        return wins > 2
    }
}

struct BaseballRecord: Record, Prizable{
    
    var wins: Int
    var losses: Int
    //重写覆盖了协议扩展的默认实现
    let gamePlayedCount: Int = 162
    
//    func winningPercent() -> Double {
//        return Double(wins) / Double(gamePlayedCount)
//    }
    
    func isPrizable() -> Bool {
        return wins > 10 && winningPercent() > 0.5
    }
}


struct FootballRecord: Record, Tieable, Prizable{
    
    var wins: Int
    var losses: Int
    var ties: Int
    
//    //重写属性实现
//    var gamePlayedCount: Int{
//        return wins + losses + ties
//    }
    
//    func winningPercent() -> Double {
//        return Double(wins) / Double(gamePlayedCount)
//    }
    
    func isPrizable() -> Bool {
        return wins > 1
    }
}
let baseKetTeamRecord = BasketballRecord(wins: 2, losses: 10)
print(baseKetTeamRecord)
baseKetTeamRecord.shoutWins()
baseKetTeamRecord.gamePlayedCount

let baseTeamRecord = BaseballRecord(wins: 10, losses: 5)
baseTeamRecord.gamePlayedCount

let footballRecord = FootballRecord(wins: 2, losses: 1, ties: 1)
footballRecord.gamePlayedCount
footballRecord.winningPercent()


//再举例
extension CustomStringConvertible{
    var descriptionWithDate: String{
        return NSDate().description + " " + description
    }
}
print(baseKetTeamRecord.descriptionWithDate)

//------------协议的聚合使用------------------
//&表示既遵守也遵守
func award(one: Prizable & CustomStringConvertible){
    if one.isPrizable() {
        print(one)
        print("You won a prize!")
    }else{
        print("You can not won a prize~")
    }
}

award(one: footballRecord)

struct Student:Prizable, CustomStringConvertible{
    var name: String
    var score: Int
    
    var description: String{
        return name
    }
    
    func isPrizable() -> Bool {
        return score > 60
    }
}

let student = Student(name: "DNCoder", score: 99)
award(one: student)




