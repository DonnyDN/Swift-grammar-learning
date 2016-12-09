//: [Previous](@previous)

import Foundation

//----------集合（无序的数据集）-----------
var skillsOfA: Set<String> = ["swift" , "OC", "OC"]
var skillsOfB: Set = ["JavaScript" , "CSS", "Html"]
var skillsOfC: Set<String> = []


/*
 集合能保证内部数据都是唯一的，不会重复；
 集合时无序的，查找，去重会比数组快；
 有一些特殊的操作
 */


//空集合
var emptySet1: Set<Int> = []
var emptySet2 = Set<Double>()




var vowels = Set(["A","E","I","O","U","U"])
vowels.count
vowels.isEmpty
emptySet1.isEmpty

let e = skillsOfA.first//e是可选型

skillsOfA.contains("swift")

for skill in skillsOfB {
    print(skill)
}

//比较
let setA: Set = [1,2,3]
let setB:Set = [3,2,1,3,2,1,2,1,1,1,1]
setA == setB


//添加操作
skillsOfC.insert("swift")
skillsOfC

//删除
skillsOfC.remove("swift")
skillsOfC

if let skill = skillsOfB.remove("Html") {
    print("html is removed")
}

skillsOfC.removeAll()

//集合特殊操作， 并集
skillsOfA
skillsOfB
//+
skillsOfA.union(skillsOfB)
skillsOfA

//+=
skillsOfA.formUnion(skillsOfB)
skillsOfA
skillsOfB

//交集，共有元素
skillsOfA
skillsOfB
skillsOfA.intersection(skillsOfB)

//subtract减去，自己独有的
skillsOfA
skillsOfB
skillsOfA.subtract(skillsOfB)
skillsOfA

//对称差集
skillsOfA
skillsOfB
skillsOfA.symmetricDifference(skillsOfB)
skillsOfA
skillsOfB

//sequence参数，集合／数组都可以
skillsOfA.union(["a","b"])
skillsOfA


var skillsOfD:Set = ["swift"]
//子集
skillsOfD.isSubset(of: skillsOfA)
//真子集
skillsOfD.isStrictSubset(of: skillsOfA)

//超集
skillsOfA.isSuperset(of: skillsOfD)
//真超集
skillsOfA.isStrictSuperset(of: skillsOfD)

//相离的,相异的，不同的
skillsOfA
skillsOfB
skillsOfD
skillsOfA.isDisjoint(with: skillsOfB)
skillsOfA.isDisjoint(with: skillsOfD)






//创建set集合
var set1:Set<Int> = [1,2,3,4]
//进行下标的移动
//获取某个下标后一个元素
//swlft2.2
//set1[set1.startIndex.successor()]
//swift3.0
set1[set1.index(after: set1.startIndex)]
//获取某个下标后几位的元素
//swift2.2
//set1[set1.startIndex.advancedBy(3)]
//swift3.0
set1[set1.index(set1.startIndex, offsetBy: 3)]
//获取集合中的最大值
//swift2.2
//set1.maxElement()
//swift3.0
set1.max()
//获取集合中的最小值
//swift2.2
//set1.minElement()
//swift3.0
set1.min()
//移除集合中某个位置的元素
//swift2.2
//set1.removeAtIndex(set1.indexOf(3)!)
//swift3.0
set1.remove(at: set1.index(of: 3)!)
var set3:Set<Int> = [1,2,3,4]
var set4:Set<Int> = [1,2,5,6]
//返回交集 {1，2}
//swift2.2
//var setInter = set3.intersect(set4)
//swift3.0
var setInter = set3.intersection(set4)
//返回交集的补集{3，4，5，6}
//swift2.2
//var setEx = set3.exclusiveOr(set4)
//swift3.0
var setEx = set3.symmetricDifference(set4)

var set5:Set = [1,2]
var set6:Set = [2,3]
var set7:Set = [1,2,3]
var set8:Set = [1,2,3]
//判断是否是某个集合的子集 set5是set7的子集 返回ture
//swift2.2
//set5.isSubsetOf(set7)
//swift3.0
set5.isSubset(of: set7)
//判断是否是某个集合的超集 set7是set5的超集 返回ture
//swift2.2
//set7.isSupersetOf(set5)
//swift3.0
set7.isSuperset(of: set5)
//判断是否是某个集合的真子集 set5是set7的真子集 返回ture
//swift2.2
//set5.isStrictSubsetOf(set7)
//swift3.0
set5.isStrictSubset(of: set7)
//判断是否是某个集合的真超集 set7不是set8的真超集 返回false
//swift2.2
//set7.isStrictSupersetOf(set8)
//swift3.0
set7.isStrictSuperset(of: set8)

