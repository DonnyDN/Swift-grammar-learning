//: [Previous](@previous)

import Foundation

//（函数式编程--高阶函数）---------------------------
func changeScores(scores:inout [Int] , by changeMethod:(Int)->Int){
    for (index,score) in scores.enumerated() {
        scores[index] = changeMethod(score)
    }
}

func change1(score: Int) -> Int{
    return Int(sqrt(Double(score))*10)
}
func change2(score:Int) -> Int{
    return Int(Double(score) / 150.0 * 100.0)
}
func change3(score:Int) -> Int{
    return score + 1;
}
var scores1 = [34,23,35,56,67]
changeScores(scores: &scores1, by: change1)

var scores2 = [45,67,43,32,21]
changeScores(scores: &scores2, by: change2)//此高阶函数inout了数组，改变数组值了
changeScores(scores: &scores2, by: change3)

//（函数式编程--高阶函数）---------------------------

func tier1MailFeeByWeight(weight:Int) -> Int{
    return 1*weight
}

func tier2MailFeeByWeight(weight: Int) -> Int{
    return 2*weight
}
//func chooseMailFeeCaculationByWeight(_ weight: Int) -> (Int) -> Int{
//    //计算邮费
//    return weight <= 10 ? tier1MailFeeByWeight: tier2MailFeeByWeight
//}

func feeByUnitPrice(price: Int , weight: Int) -> Int{
    //函数嵌套，不需要暴露接口在外面
    func chooseMailFeeCaculationByWeight(_ weight: Int) -> (Int) -> Int{
        //计算邮费
        return weight <= 10 ? tier1MailFeeByWeight: tier2MailFeeByWeight
    }
    //mailFeeByWeight 是个函数常量
    let mailFeeByWeight = chooseMailFeeCaculationByWeight(weight)
    return  mailFeeByWeight(weight) + price * weight
}

feeByUnitPrice(price: 10, weight: 11)



//----------map操作（定义在数组上）-------------
//scores1.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

scores1
scores1.map(change3)//遍历数组，把chenge3的返回值返回到新数组中，不改变scores1数组
scores1
func isPassOrFail(score:Int) -> String{
    return score > 60 ? "Pass" : "Fail"
}
scores1.map(isPassOrFail)


//----------filter操作（定义在数组上）-------------
//scores1.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

scores1
func fail(score:Int) -> Bool{
    return score < 60
}
scores1.filter(fail)//filter过滤的意思，返回Bool判断是否满足条件
scores1


//----------reduce操作（定义在数组上）-------------
/*reduce 简化 缩减
 * @pram:<#T##initialResult: Result##Result#> 初始值
 * @pram:<#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>方法
 */
//scores1.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)

scores1
func add4(num1:Int , _ num2:Int) -> Int{
    return num1 + num2
}
scores1.reduce(0, add4)
scores1.reduce(0, +)
scores1.reduce(1, +)
scores1.reduce(0, -)
scores1
func concatenate(str:String , num:Int) -> String{
    return str + String(num) + "-"
}
scores1.reduce("", concatenate)
