//
//  ShopModel.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//


import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct listmenu: Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var boxname:String
    var showmenu:[menu]
}

struct menu: Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var ItemView:String
    var prise:Int
    var name:String
    var infrom:foodinfrom
    var swNumber:Int
    var like:Bool
}

struct Oder: Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var menu:menu
    var numbers:Int
}

struct foodinfrom: Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var foodweight:String
    var supply:String
    var foodtime:String
}

struct order:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var onOrder:[Oder]
}


               //傳值
class ShopMenu:ObservableObject {
    
    @Published var en_number = 0
    @Published var Shoppingtest:[listmenu] = [listmenu]()
    @Published var Shoppings:[menu] = [menu]() //要回傳的，所以要先去宣告一個職
    @Published var showOrder = [Oder]()
    @Published var likeOrder = [Oder]()
    @Published var Orders = [order]()
    @Published var onoffs:Bool =  false
    
    
    init(){
        shoping()
        Orders = [
            order(onOrder: showOrder)
        ]
    }
    func shoping()  {
        Shoppings = [
            menu(ItemView: "images-2", prise:30, name: "白花芥藍", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-3", prise:50, name: "白花椰", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
            menu(ItemView: "images-4", prise:40, name: "牛奶白菜", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-9", prise:25, name: "甜羅美", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-10", prise:30, name: "大陸妹", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-11", prise:25, name: "咸豐菜", infrom: foodinfrom(foodweight: "?", supply: "謝唯琪", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
            menu(ItemView: "images-12", prise:25, name: "人參菜", infrom: foodinfrom(foodweight: "?", supply: "謝唯琪", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-13", prise:55, name: "山葵葉", infrom: foodinfrom(foodweight: "?", supply: "陳守安", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-14", prise:35, name: "豆瓣菜", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-15", prise:35, name: ":黑葉白菜", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-16", prise:35, name: "龍葵", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-17", prise:35, name: "黃花芥藍", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-18", prise:30, name: "地瓜葉", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-16", prise:30, name: "龍葵", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "香菜-1100x1100", prise:30, name: "香菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-19", prise:30, name: "韭菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-10", prise:30, name: "福山萵苣", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "images-20", prise:35, name: "羽衣甘藍", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "Cabbage", prise:50, name: "高麗菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "Gracilaria", prise:30, name: "龍鬚菜", infrom: foodinfrom(foodweight: "?", supply: "白炳輝", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "spinach", prise:40, name: "菠菜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "cabbage＿sprouts", prise:35, name: "高麗菜芽", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            menu(ItemView: "Cabbage", prise:50, name: "高麗菜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
        ]
        Shoppingtest = [
            listmenu(boxname: "葉菜類清單", showmenu: [
                menu(ItemView: "images-2", prise:30, name: "白花芥藍", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-3", prise:50, name: "白花椰", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-4", prise:40, name: "牛奶白菜", infrom: foodinfrom(foodweight: "?", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-9", prise:25, name: "甜羅美", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-10", prise:30, name: "大陸妹", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-11", prise:25, name: "咸豐菜", infrom: foodinfrom(foodweight: "?", supply: "謝唯琪", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-12", prise:25, name: "人參菜", infrom: foodinfrom(foodweight: "?", supply: "謝唯琪", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-13", prise:55, name: "山葵葉", infrom: foodinfrom(foodweight: "?", supply: "陳守安", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-14", prise:35, name: "豆瓣菜", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-15", prise:35, name: ":黑葉白菜", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-16", prise:35, name: "龍葵", infrom: foodinfrom(foodweight: "?", supply: "黃金山", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-17", prise:35, name: "黃花芥藍", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-18", prise:30, name: "地瓜葉", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-16", prise:30, name: "龍葵", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "香菜-1100x1100", prise:30, name: "香菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-19", prise:30, name: "韭菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-10", prise:30, name: "福山萵苣", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-20", prise:35, name: "羽衣甘藍", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "Cabbage", prise:50, name: "高麗菜", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "Gracilaria", prise:30, name: "龍鬚菜", infrom: foodinfrom(foodweight: "?", supply: "白炳輝", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "spinach", prise:40, name: "菠菜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "cabbage＿sprouts", prise:35, name: "高麗菜芽", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "Cabbage", prise:50, name: "高麗菜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            ]),
            listmenu(boxname: "水果類和其他類清單", showmenu: [
                menu(ItemView: "images-21", prise:35, name: "木瓜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-22", prise:55, name: "臍橙", infrom: foodinfrom(foodweight: "?", supply: "李建南", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-23", prise:140, name: "小蕃茄", infrom: foodinfrom(foodweight: "?", supply: "周芳民", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-24", prise:20, name: "無籽檸檬", infrom: foodinfrom(foodweight: "?", supply: "李建南", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-25", prise:30, name: "柳丁", infrom: foodinfrom(foodweight: "?", supply: "李建南", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-26", prise:30, name: "香蕉", infrom: foodinfrom(foodweight: "?", supply: "張豐巖", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-27", prise:50, name: "金棗", infrom: foodinfrom(foodweight: "?", supply: "李建南", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images", prise:88, name: "牛奶玉米", infrom: foodinfrom(foodweight: "40", supply: "賴寬宏", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-5", prise:50, name: "香菇", infrom: foodinfrom(foodweight: "?", supply: "葉光輝", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-6", prise:25, name: "杏鮑菇", infrom: foodinfrom(foodweight: "?", supply: "方永芳", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "cucumber", prise:45, name: "小黃瓜", infrom: foodinfrom(foodweight: "?", supply: "黃仁違", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-7", prise:30, name:"木耳", infrom: foodinfrom(foodweight: "?", supply: "豐年農場", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-7", prise:30, name: "木耳", infrom: foodinfrom(foodweight: "?", supply: "游景", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-8", prise:109, name: "銀耳", infrom: foodinfrom(foodweight: "?", supply: "莊凱奇", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "Hongxi＿Mushroom", prise:30, name: "鴻禧菇 ", infrom: foodinfrom(foodweight: "?", supply: "莊凱奇", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-28", prise:30, name: "白美人菇", infrom: foodinfrom(foodweight: "?", supply: "莊凱奇", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-29", prise:30, name: "黑美人菇", infrom: foodinfrom(foodweight: "?", supply: "莊凱奇", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-30", prise:85, name: "巴西蘑菇", infrom: foodinfrom(foodweight: "?", supply: "蕭貴昇", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-31", prise:30, name: "彩椒", infrom: foodinfrom(foodweight: "?", supply: "何嘉軒", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-32", prise:80, name: "茭白筍", infrom: foodinfrom(foodweight: "?", supply: "羅逸豐", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "onion", prise:20, name: "刺蔥", infrom: foodinfrom(foodweight: "?", supply: "張譽庭", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-33", prise:45, name: "白蘿蔔", infrom: foodinfrom(foodweight: "?", supply: "余水永", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-34", prise:60, name: "玉米筍", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-35", prise:30, name: "糯米椒", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-36", prise:35, name: "青蔥", infrom: foodinfrom(foodweight: "?", supply: "陳世閔", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-37", prise:100, name: "竹薑", infrom: foodinfrom(foodweight: "?", supply: "張豐巖", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-38", prise:150, name: "乾燥竹薑", infrom: foodinfrom(foodweight: "?", supply: "張豐巖", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-39", prise:25, name: "牛蕃茄", infrom: foodinfrom(foodweight: "?", supply: "王韋智", foodtime: "冷藏5~7天"), swNumber: 0, like: false),//斤
                menu(ItemView: "images-40", prise:60, name: "青花筍", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
                menu(ItemView: "images-41", prise:40, name: "甜菜", infrom: foodinfrom(foodweight: "?", supply: "黃詩瑜", foodtime: "冷藏5~7天"), swNumber: 0, like: false),
            ])
        ]
        
    }
    
  
    
    func mark(id:String,Lk:Bool){
       var index = Shoppings.firstIndex { me in
            me.id == id
        } ?? 0
        Shoppings[index].like = Lk
    }
    
    func addOrder(value:menu,quanty:Int ){
        let Index = showOrder.firstIndex(where: { od in
            od.menu.name == value.name
        })
        if (Index != nil) {
            showOrder[Index!].numbers += quanty
            
        }else{
            showOrder.append(Oder(menu: value, numbers: quanty))
        }
    }
    func lowerOrder(value:menu ){
        let Index = showOrder.firstIndex(where: { od in
            od.menu.name == value.name
        })
        if (Index != nil) {
            if showOrder[Index!].numbers > 1 {
                showOrder[Index!].numbers -= 1
            }else{
                showOrder.removeAll()
            }
            
        }else{
            showOrder.append(Oder(menu: value, numbers: 1))
        }
    }
    func addlike(value:menu,quanty:Int ){
        let Index = likeOrder.firstIndex(where: { od in
            od.menu.like == value.like
        })
        if (Index != nil) {
            likeOrder.removeAll()
            
        }else{
            likeOrder.append(Oder(menu: value, numbers: quanty))
        }
    }
    func toltolprise(prises:Int ,number:Int ) -> Int {
        let anser = prises*number
        return anser
    }
    
    func sumPrise(temp_orders:[Oder]) -> Int {
        
        var sum = 0
        
        for od in temp_orders {
            sum += toltolprise(prises: od.menu.prise, number: od.numbers)
        }
        
        return sum
    }
}

class Cacus:ObservableObject{
    
    func cacu_money(foodname:Float,qauntity:Float) -> Float {
        let anser = foodname * qauntity
        return anser
    }
    
    func cacu_health(height:Float) -> Float{
        let anser = height/2
        return anser
        
    }
    
}


//Codable 為了要和Firebace連結
//class ShopMenu: ObservableObject {

/*其他
 名稱:牛奶玉米  價錢:88      生產者:賴寬宏
 名稱:香菇          價錢:50      生產者:葉光輝
 名稱:杏鮑菇      價錢:25      生產者:方永芳
 名稱:小黃瓜      價錢:45      生產者:黃仁違
 名稱:木耳          價錢:30      生產者:豐年農場
 名稱:木耳          價錢:30      生產者:游景
 名稱:銀耳          價錢:109    生產者:莊凱奇 /////
 名稱:鴻禧菇      價錢:30      生產者:莊凱奇
 名稱:白美人菇  價錢:30      生產者:莊凱奇
 名稱:黑美人菇  價錢:30      生產者:莊凱奇
 名稱:巴西蘑菇  價錢:85      生產者:蕭貴昇
 名稱:彩椒          價錢:30      生產者:何嘉軒
 名稱:茭白筍      價錢:80      生產者:羅逸豐
 名稱:刺蔥          價錢20       生產者:張譽庭
 名稱:白蘿蔔      價錢:45      生產者:余水永
 名稱:玉米筍      價錢:60      生產者:陳世閔
 名稱:糯米椒      價錢:30      生產者:陳世閔
 名稱:青蔥          價錢:35      生產者:陳世閔
 名稱:竹薑          價錢100/斤 生產者:張豐巖
 名稱:乾燥竹薑  價錢:150    生產者:張豐巖
 名稱:牛蕃茄      價錢:25/斤 生產者:王韋智
 名稱:青花筍      價錢:60      生產者:黃詩瑜
 名稱:甜菜          價錢:40      生產者:黃詩瑜
 */
/* 葉菜類
 名稱:白花芥藍  價錢:30      生產者:賴寬宏
 名稱:白花椰      價錢:53      生產者:賴寬宏
 名稱:牛奶白菜  價錢:40      生產者:賴寬宏
 名稱:甜羅美      價錢:25      生產者:黃詩瑜
 名稱:大陸妹      價錢:30      生產者:黃詩瑜
 名稱:咸豐菜      價錢:25      生產者:謝唯琪
 名稱:人參菜      價錢:25      生產者:謝唯琪
 名稱:山葵葉      價錢:55      生產者:陳守安
 名稱:豆瓣菜      價錢:35      生產者:黃金山
 名稱:黑葉白菜  價錢35       生產者:黃金山
 名稱:龍葵          價錢:35      生產者:黃金山
 名稱:黃花芥藍  價錢:35      生產者:陳世閔
 名稱:地瓜葉      價錢:30      生產者:陳世閔
 名稱:龍葵          價錢:30      生產者:陳世閔
 名稱:香菜          價錢:30      生產者:陳世閔
 名稱:韭菜          價錢:30      生產者:陳世閔
 名稱:福山萵苣  價錢:30      生產者:陳世閔
 名稱:羽衣甘藍  價錢35       生產者:陳世閔
 名稱:高麗菜      價錢:50      生產者:陳世閔
 名稱:龍鬚菜      價錢:30      生產者:白炳輝
 名稱:菠菜          價錢:40      生產者:黃詩瑜
 名稱:高麗菜芽  價錢:35      生產者:黃詩瑜
 名稱:高麗菜      價錢:50      生產者:黃詩瑜
 */
/*水果
 名稱:木瓜          價錢:35      生產者:黃詩瑜
 名稱:臍橙          價錢:55/斤 生產者:李建南
 名稱:小蕃茄      價錢:140    生產者:周芳民
 名稱:無籽檸檬  價錢:20      生產者:李建南
 名稱:柳丁  價錢:30      生產者:李建南
 名稱:香蕉  價錢:30/斤      生產者:張豐巖
 名稱:金棗          價錢:50      生產者:李建南
 */

