//: [Previous](@previous)

import Foundation

/**弃用++ --
  :++ --使程序可读性差，Python里也没有
 */
var a = 3
//a++ a--
a += 1
a -= 1

/**弃用C风格for循环，创建灵活的for循环--------*/
for i in (1...10).reversed() {//倒序
    print(i)
}

for i in stride(from: 0, to: 10, by: 2) {//步长为2，[0,10）
    print("to \(i)")
}
for i in stride(from: 0, through: 10, by: 2) {//步长为2，[0,10]
    print("through \(i)")
}
for i in stride(from: 10, to: 0, by: -2) {//[10,0)
    print("倒序 \(i)")
}
for i in stride(from: 0.5, to: 0, by: -0.1) {//也可是小数
    print("小数 \(i)")
}

/**元祖的变化*/



