//: [Previous](@previous)

import Foundation

protocol Prizable{
    func isPrizable() -> Bool
}

struct Student: CustomStringConvertible, Equatable, Comparable, Prizable{
    var name: String
    var score: Int
    var description: String{
        return name + " Score: " + String(score)
    }
    
    func isPrizable() -> Bool {
        return score >= 60
    }
}
func ==(s1:Student,s2:Student) -> Bool{return s1.score == s2.score}
func <(s1:Student,s2:Student) -> Bool{return s1.score < s2.score}

let DNCoder = Student(name: "DNCoder", score: 100)
let a       = Student(name: "Alice", score: 80)
let b       = Student(name: "Bob", score: 92)
let c       = Student(name: "Karl", score: 85)

let students = [a, b, c, DNCoder]

func topOne<T: Comparable>(seq: [T]) -> T{
    assert(seq.count > 0)//断言判断seq数组有值
    //把数组元素压缩处理成一个元素：seq[0]是数组初始值，后面{ max($0, $1) }是结尾闭包处理方法，取最大值，$0是上一次比较后得到的结果，$1是每次从这个数组中新的要进行比较的元素
    return seq.reduce(seq[0]){ max($0, $1) }
}

//以下seq数组的元素都是可比较的，都默认实现了Comparable协议
topOne(seq: [2,4,5,7])
topOne(seq: ["Hello", "Swift"])
topOne(seq: students)


//协议聚合&  返回一个可选型T?,不仅因为seq数组可能为空，也由于数组内元素可能不被奖励
func topPrizableOne<T: Comparable & Prizable>(seq:[T]) ->T?{
    //tempTop: T?，比较至今有可能都是空的，更何况第一次是从nil开始的，故？
    //contender 竞争者，从seq数组中拿出来的，类型非空
    return seq.reduce(nil){ ( tempTop: T?, contender: T ) in
        
        //判断一下 该元素是否可被奖励（score>=60）,不是的话就不用比了
        guard contender.isPrizable() else{
            return tempTop
        }
        
        //暂时的优胜者tempTop若解包失败，那就返回下一个竞争者
        guard let tempTop = tempTop else{
            return contender
        }
        
        //以上判断没有分出胜负，就需要真正的比较一下了
        return max(tempTop, contender)
    }
}

//因为函数返回是个可选型，故？
topPrizableOne(seq: students)?.name


		
