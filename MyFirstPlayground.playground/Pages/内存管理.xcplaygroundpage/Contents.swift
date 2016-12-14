//: [Previous](@previous)

import UIKit

class Person{
    
    var name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print(name, "is initialized!")
    }
    
    //对象释放在deinit，默认不用写
    deinit {
        print("😢",name,"is being deinitialized~ \n")
    }
}

var  DNCoder: Person? = Person(name: "DNCoder")
var DN = DNCoder
DNCoder = nil//此时DNCoder的引用计数是2，需要DN = nil，才能释放DNCoder

/*
func inTheShop() {
    
    for i in 1...10 {
        
        print("=========")
        print(i)
        //一个大括号{}就相当于一个作用域
        let DN = Person(name: "DN")
        DN.doSomething()
    }
}
inTheShop()
*/
class Apartment{
    
    let name: String
    //弱引用：Apartment并不想拥有Person，不给Person加1
    //注意weak修饰的必须是var而且是？可选型；
//    weak var tenant: Person?
    
    //关键字unowned和weak意义差不多，用unowned需要保证类型不是可选型，也就是非空的,即此属性不能被赋值为nil，否则会报错
    //unowned和weak只能用于class类型，不能用于函数类型的变量
    unowned let tenant: Person
    
    
    init(name: String, tenant:Person) {
        self.name = name
        self.tenant = tenant
        print(name, "is initialized!")
    }
    
    deinit {
        print("😢",name,"is being deinitialized~ \n")
    }
    
}

var Tom: Person? = Person(name: "Tom")
var TomApartment: Apartment? = Apartment(name: "TomApartment", tenant: Tom!)

Tom?.apartment = TomApartment
//TomApartment引用计数2
//Tom引用计数2

TomApartment = nil//引用计数1（未释放）
Tom = nil//引用计数1（未释放）
//TomApartment = nil若在Tom = nil之后的话，以下一句会报错，由于上面Tom被赋值nil，而tenant是被unowned修饰的，所以TomApartment?.tenant指向了一块不该被调用的空间（没有指向nil），被调用就会报错

TomApartment?.tenant//注意这里的nil不是tenant为nil，而是TomApartment?
//TomApartment = nil//引用计数1（未释放）


//-----------两段式构造技巧--------------
class Country{
    
    let name: String
    //这里让Country初始化时，让City暂时为空（隐式的可选型）
    var capital: City!
    
    init(countryName: String, capitalName: String) {
        self.name = countryName
        //这里的两段式构造，country对象还没构造完，City的构造函数却引用了country
        self.capital = City(cityName: capitalName, country: self)
        print("Country",name,"is initialized!")
    }
    
    deinit {
        print("Country",name,"is being deinitialized~")
    }
}

class City{
    
    let name: String
    unowned let country: Country
    
    init(cityName: String, country: Country) {
        self.name = cityName
        self.country = country
        print("City",name,"is initialized!")
    }
    deinit {
        print("City",name,"is being initialized~")
    }
}
		