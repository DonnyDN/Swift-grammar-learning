import UIKit
//Sources 只是用于定义变量 结构或者类，不能执行

enum Theme{
    case DayMode
    case NightMode
}

class UI2{
    //不希望外界修改fontColor
    private var fontColor: UIColor!
    var bgColor:UIColor!
    var themeMode:Theme = .DayMode{
        //注意，didset和willset不会在初始化阶段init调用；变量设置了初始值，且设置成let，也不会调用
        didSet{
            self.chengeTheme(themeMode:themeMode)
        }
    }
    
    init(themeMode:Theme) {
        self.themeMode = themeMode
        self.chengeTheme(themeMode: themeMode)
    }
    //不希望外界修改chengeTheme
    private func chengeTheme(themeMode:Theme) {
        switch themeMode {
        case .DayMode:
            self.fontColor = UIColor.black
            self.bgColor = UIColor.white
        case .NightMode:
            self.fontColor = UIColor.white
            self.bgColor = UIColor.black
        }
    }
}

let ui2 = UI2(themeMode: .DayMode)
//ui2.themeMode
//ui2.fontColor
//ui2.bgColor
