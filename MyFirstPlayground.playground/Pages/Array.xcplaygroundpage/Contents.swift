//: [Previous](@previous)

import Foundation

//数组只能存同一类型的数据
var numbers = [0,1,2,3,4,5]
var numbers1: [Int] = [0,1,2,3,4,5]
var numbers2: Array<Int> = [0,1,2,3,4,5]//<Int>泛型

var array11:[Character] = ["A","a","B"]

//var emptyArray = []//错误
var emptyArray1: [Int] = []
var emptyArray5: [Int] = [Int]() //构造函数
var emptyArray2: Array<Int> = []
var emptyArray3 = Array<Int>()
var emptyArray4 = [Int]() //构造函数

var allZeros = [Int](repeatElement(0, count: 5))

var allZeros1 = Array<Int>(repeatElement(0, count: 5))


var array22: NSArray = []

//-----------------数组用法-------------------
var vowels = ["A","E","I","O","U"]
var nums = [1,2,3,4,5,6]

vowels.count
vowels.isEmpty
vowels[2]
vowels.first
vowels.last
//vowels.first 和 vowels.last 都是可选型数据，因为有时候数组为空
if let firstValue = vowels.first {
    firstValue
}

vowels.min()
vowels.max()

//不包含4的
nums[2..<4]
nums[0..<nums.count]

nums.contains(2)
vowels.contains("B")

vowels.index(of: "E")
//遍历
for index in 0..<nums.count {
    nums[index]
}

for number in nums {
    print(number)
}
vowels
for (i, vowel) in vowels.enumerated() {
    print("\(i+1): \(vowel)")
}
//比较
var oneToFive = [1,2,3,4,5,6]
oneToFive == nums

//添加
nums.append(7)
nums + [7]//这不是给数组增加新元素

nums
nums.insert(contentsOf: [9], at: 7)
nums.insert(8, at: 7)

nums.removeLast()
nums.removeFirst()
nums

nums.removeFirst(4)
nums.removeSubrange(0..<2)

nums.removeAll()


nums = [1,2,3,4,5,6]



//---------------二维数组-------------------
var board: Array<Array<Int>> = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]]

var board1: [[Int]] = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]]

var board2: [Array<Int>] = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]]

board[0][0]
board.count
board[0].count
board[0].append(0)
board

board1.append([0,0,0])
board1 += [[0,0,0]]

//---------------NSArray数组-------------------
//as关键字来转化
var arr = [] as NSArray
var arr1: NSArray = []

//NSArray中存不同类型的数据
arr = [1,"hello",true]

//区别：NSArray是个类，swift的数组是个结构





//创建大量相同元素的数组
//创建有10个String类型元素的数组，并且每个元素都为字符串"Hello"
//swift2.2
//var array3 = [String](count: 10, repeatedValue: "Hello")
//swift3.0
var array3 = [String](repeating: "Hello", count: 10)
//创建有10个Int类型元素的数组，且每个元素都为1
//swift2.2
//var array4 = Array(count: 10, repeatedValue: 1)
//swift3.0
var array4 = Array(repeating: 1, count: 10)

var array = [1,2,3,4,5,6,7,8,9]
//向数组中追加一组元素
//swift2.2
//array.appendContentsOf([11,12,13])
//swift3.0
array.append(contentsOf: [11,12,13])
//向数组中的某个位置插入一个元素
//swift2.2
//array.insert(0, atIndex: 0)
//swift3.0
array.insert(0, at: 0)
//向数组中的某个位置插入一组元素
//swift2.2
//array.insertContentsOf([-2,-1], at: 0)
//swift3.0
array.insert(contentsOf: [-2,-1], at: 0)
//移除数组中某个位置的元素
//swift2.2
//array.removeAtIndex(1)
//swift3.0
array.remove(at: 1)
//移除一个范围内的元素
//swift2.2
//array.removeRange(0...2)
//swift3.0
array.removeSubrange(0...2)
//修改一个范围内的元素
//swift2.2
//array.replaceRange(0...2, with: [0,1])
//swift3.0
array.replaceSubrange(0...2, with: [0,1])
//进行数组枚举遍历 将输出 (0,0) (1,1) (2,2) (3,3) (4,4)
//swift3.0 中将枚举属性enumerate 修改为enumerated()方法
for item in array.enumerated(){
    print(item)
}
var arraySort = [1,3,5,6,9,7]
//获取数组中的最大值
//swift2.2
//arraySort.maxElement()
//swift3.0
arraySort.max()
//获取数组中的最小值
//swift2.2
//arraySort.minElement()
//swift3.0
arraySort.min()
//从大到小排序
//swift2.2
//arraySort = arraySort.sort(>)
//swift3.0
arraySort = arraySort.sorted()//默认从小到大
arraySort = arraySort.sorted(by: >)
//从小到大排序
//swift2.2
//arraySort = arraySort.sort(<)
//swift3.0
arraySort = arraySort.sorted(by: <)


