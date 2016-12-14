//: [Previous](@previous)

import UIKit

//断言处理错误只在程序编译时有用，打包release之后无效

//assert(<#T##condition: Bool##Bool#>)
//assert(<#T##condition: Bool##Bool#>, <#T##message: String##String#>)

//assertionFailure是强制退出程序
//assertionFailure()
//assertionFailure(<#T##message: String##String#>)


//程序运行中若要错误判断的话，用precondition
//precondition(<#T##condition: Bool##Bool#>)
//precondition(<#T##condition: Bool##Bool#>, <#T##message: String##String#>)
//preconditionFailure()
//preconditionFailure(<#T##message: String##String#>)

//程序运行到此，自动结束程序
//fatalError()
//fatalError(<#T##message: String##String#>)


class VendingMachine{
    
    struct Item {
        
        enum `Type`: String {
            case Water
            case Cola
            case Juice
        }
        
        let type: Type
        let price: Int
        var count: Int
    }
    
    //系统提供一个错误类型（实为协议），3.0后改为Error；
    enum ErrorType: Error, CustomStringConvertible{
        case NoSuchItem          //无此产品
        case NotEnoughMoney(Int) //钱不够(在此给枚举一个关联值，抛出同时提示一些信息出去)
        case OutOfStock          //售罄了
        
        var description: String{
            switch self {
            case .NoSuchItem:
                return "No Such Item"
            case .NotEnoughMoney(let price):
                return "Not Enought Money "+"\(price)￥ needed"
            case .OutOfStock:
                return "Out of Stock"
            }
        }
    }
    private var items = ["Mineral Water" : Item(type: .Water, price: 2, count: 10),
                         "Coca Cola" : Item(type: .Cola, price:3, count:5),
                         "Orange Juice" : Item(type: .Juice, price:5, count:3)]
    
    //我们希望vend函数在判断多种错误时，会抛出异常，用throws关键字，表示此函数有可能抛出异常而终止，也有可能正常返回Int值
    func vend(itemName:String, money:Int) throws -> Int {
        
        //控制转移（用多了会使可读性变差）：defer延迟执行的意思，此方法在将要执行完return之前会执行此defer内的代码；
        defer {
            print("Have a nice day!")
        }
        
        guard let item = items[itemName] else {
            //抛出异常后，此函数结束，也不会继续执行return,可以删掉
            //在此类中定义的ErrorType，故可省略VendingMachine.
//            throw VendingMachine.ErrorType.NoSuchItem
            throw ErrorType.NoSuchItem
//            return money
        }
        
        guard money >= item.price else {
            throw ErrorType.NotEnoughMoney(item.price)
//            return money
        }
        
        guard item.count >= 1 else {
            throw VendingMachine.ErrorType.OutOfStock
//            return money
        }
        
        //若方法内有多个defer，将倒序执行；另外若函数在之前guard判断就return结束的话，将不会执行后面的这个defer，会执行前面的defer，
        defer {
            print("Thank You")
        }
        //分配商品
        dispenseItem(itemName: itemName)
        
        return money - item.price
        
    }
    
    private func dispenseItem(itemName: String){
        items[itemName]!.count -= 1
        print("Enjoy your ",itemName)
    }
    
    func display() {
        print("Want something to drink?")
        for itemName in items.keys {
            print("* ", itemName)
        }
        print("========================")
    }
    
    
}

let machine = VendingMachine()
machine.display()

//---------异常处理1--------------------
var money = 3
//调用可抛出异常的函数，就需要处理异常：用try关键字，加!表示强制处理异常，相信不会抛出异常
try! machine.vend(itemName: "Coca Cola", money: money)

//---------异常处理2--------------------
var money1 = 2
//让函数不用抛出异常停止程序，可以抛出nil
//try? machine.vend(itemName: "Coca Cola", money: money1)
if let leftmoney = try? machine.vend(itemName: "Coca Cola", money: money1){
    //
}else{
    //Error Handing
}

//---------异常处理3--------------------
do{
    money1 = try machine.vend(itemName: "Coca Cola", money: money1)
    print(money1, "Yuan Left")
}
//catch{
//    print("Error occured during vending!")
//}
catch VendingMachine.ErrorType.NoSuchItem{
    //捕获函数抛出的不同类型错误
    print("No Such Item")
}
//catch VendingMachine.ErrorType.NotEnoughMoney{
//    print("Not Enough Money")
//}
catch VendingMachine.ErrorType.NotEnoughMoney(let price){
    print("Not Enough Money", "\(price)￥ needed")
}
catch VendingMachine.ErrorType.OutOfStock{
    print("OutOfStock")
}
//未知的错误类型
catch{
    print("Error occured during vending")
}

//---------异常处理4--------------------
do{
    money1 = try machine.vend(itemName: "Coca Cola", money: money1)
    print(money1, "Yuan Left")
}
//定义常量error，as强转为VendingMachine.ErrorType
catch let error as VendingMachine.ErrorType{
    print(error)
}






