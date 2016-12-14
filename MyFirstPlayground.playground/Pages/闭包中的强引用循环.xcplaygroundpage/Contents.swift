//: [Previous](@previous)

import Foundation

class SmartAirConditioner{//智能空调
    
    var temperature: Int = 26
    //此属性指向一个函数类型（传入Int值，无返回），本类引用了此属性，而构造函数中本属性的初始化函数（闭包）中又引用了本类的属性，产生引用循环问题
    //unowned和weak只能用于class类型，不能用于函数类型的变量
    var temperatureChange:((Int) -> ())!
    
    var printMachine: () -> () = { _ in
        print("== SmartAirConditioner ==")
    }
    
    static var downTempNum:((Int) -> Int)?
    
    
    func turndownTemp() {
        if let downTempNum = SmartAirConditioner.downTempNum {
            self.temperature = downTempNum(self.temperature)
            print("Turndown temperature")
        }
    }
    
    
    init() {
        //[]中表示捕获列表
        //写法1：[unowned self]
        //写法2：[weak self] （因为weak修饰的是可选型的，故需要对self解包处理）
        temperatureChange = { [weak self] newTemperature in
            //用`self`这种写法；或者另起一个名字weakSelf
            if let `self` = self {
                if abs(newTemperature - self.temperature) >= 10 {
                    print("It's not healthy to do it!")
                }
                else{
                    self.temperature = newTemperature
                    print("New temperature \(self.temperature) is set!")
                }
            }
        }
    }
    
    deinit {
        print("Smart Air-conditioner is being deinitialized~")
    }
}

var airCon:SmartAirConditioner? = SmartAirConditioner()
airCon?.temperature
//给temperatureChange属性初始化，需要传入一个Int
airCon?.temperatureChange(100)

airCon?.temperatureChange(24)

//在此对temperatureChange进行一个更改，闭包中不存在对self的引用，避免了引用循环问题。另外不重写此方法的话，就需要在temperatureChange的初始化中对self关键字进行弱引用
//airCon?.temperatureChange = {newTemp in
//    if newTemp >= 10 && newTemp <= 26 {
//        airCon?.temperature = newTemp
//        print("New temperature \(newTemp) is set!")
//    } else {
//        print("\(newTemp) is not a good temperature!")
//    }
//}
airCon?.temperatureChange(12)
airCon = nil


var airCon1:SmartAirConditioner? = SmartAirConditioner()

//airCon1?.temperatureChange = {newTemp in
//    if newTemp >= 10 && newTemp <= 26 {
//        airCon?.temperature = newTemp
//        print("New temperature \(newTemp) is set!")
//    } else {
//        print("\(newTemp) is not a good temperature!")
//    }
//}
SmartAirConditioner.downTempNum = { (num: Int) in
    return num - 2
}
airCon1?.temperature
airCon1?.turndownTemp()
airCon1?.temperature

airCon1 = nil


