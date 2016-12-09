//: [Previous](@previous)

import Foundation

//-------------类 定义与结构体一致---------------------
//类是引用类型
//结构体是值类型
class Person{
    
    var firstName: String
    var lastName: String
    
    init(firstName: String , lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init?(fullName:String) {
        guard let spaceIndex = fullName.range(of: " ")?.lowerBound else {
            return nil
        }
        
        self.firstName = fullName.substring(to: spaceIndex)
        self.lastName = fullName.substring(from: fullName.index(after: spaceIndex))
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
}

let person1 = Person(firstName: "Ning", lastName: "Du")
let person2 = Person(fullName: "D N")

person2?.fullName()

let person3 = person2
person3?.firstName = "A"
//证明引用类型
person2?.fullName()

person2 === person3 //判断两个引用类型是否指向同一内存，而不是存储内容一样

person3 !== person1









