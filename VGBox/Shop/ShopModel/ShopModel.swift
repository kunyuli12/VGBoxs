//
//  ShopModel.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//

import Foundation
import SwiftUI
import Combine

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
    var foodplace:String
    var foodtime:String
}

struct order:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var onOrder:[Oder]
}


               //傳值
class ShopMenu:ObservableObject {
    
    @Published var en_number = 0
    @Published var Shoppings:[menu] = [menu]() //要回傳的，所以要先去宣告一個職
    @Published var showOrder = [Oder]()
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
            menu(ItemView: "Broccoli", prise: 80, name: "花椰菜",infrom:foodinfrom(foodweight: "2台斤", foodplace: "台南", foodtime: "冷藏５～７天"),swNumber:0,like: false),
            menu(ItemView: "Cabbage", prise: 70, name: "高麗菜",infrom:foodinfrom(foodweight: "3台斤", foodplace: "台東", foodtime: "冷藏2～4天"),swNumber:0,like: false),
            menu(ItemView: "AlfalfaSprouts", prise: 45, name: "苜蓿芽",infrom:foodinfrom(foodweight: "1.5台斤", foodplace: "台南", foodtime: "冷藏3～6天"),swNumber:0,like: false),
            menu(ItemView: "Tofu", prise: 30, name: "豆腐",infrom:foodinfrom(foodweight: "2台斤", foodplace: "台東", foodtime: "冷藏6～9天"),swNumber:0,like: false),
            menu(ItemView: "cucumber", prise: 55, name: "小黃瓜",infrom:foodinfrom(foodweight: "2台斤", foodplace: "台中", foodtime: "冷4～5天"),swNumber:0,like: false)
        ]
        
    }
    
    func mark(id:String,Lk:Bool){
       var index = Shoppings.firstIndex { me in
            me.id == id
        } ?? 0
        Shoppings[index].like = Lk
    }
    
    func addOrder(value:menu ){
        let Index = showOrder.firstIndex(where: { od in
            od.menu.name == value.name
        })
        if (Index != nil) {
            showOrder[Index!].numbers += 1
            showOrder[Index!].menu.swNumber += 1
            
        }else{
            showOrder.append(Oder(menu: value, numbers: 1))
        }
    }
    func lowerOrder(value:menu ){
        let Index = showOrder.firstIndex(where: { od in
            od.menu.name == value.name
        })
        if (Index != nil) {
            showOrder[Index!].numbers -= 1
            
        }else{
            showOrder.append(Oder(menu: value, numbers: 1))
        }
    }
    
    func addshowOrder(value:menu ){
        let Index = Shoppings.firstIndex(where: { od in
            od.name == value.name
        })
        if (Index != nil) {
            Shoppings[Index!].swNumber += 1
        }
    }
    func lowershowOrder(value:menu ){
        let Index = Shoppings.firstIndex(where: { od in
            od.name == value.name
        })
        if (Index != nil) {
            Shoppings[Index!].swNumber -= 1
        }
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









/*
 func addOrderA(value:Oder){
     let Index = showOrder.firstIndex(where: { od in
         od.order.menu.name == value.menu.name
     })
     if (Index != nil) {
         showOrder[Index!].qauntity += 1
     }else{
     showOrder.append(order(order: value, qauntity: 1))
     }
 }
*/








//Codable 為了要和Firebace連結
//class ShopMenu: ObservableObject {


/*
 class ShopMenu:ObservableObject {
     
     @Published var en_number = 0
     @Published var Shoppings:[Oder] = shoping()
     
     
     static func shoping() -> [Oder] {
         let tem = [
             Oder(menu: Menu(ItemView: "Broccoli", prise: "80", name: "花椰菜"), numbers: 9,infrom:foodinfrom(foodweight: "", foodplace: "", foodtime: "")),
             Oder(menu: Menu(ItemView: "Cabbage", prise: "70", name: "高麗菜"), numbers: 9,infrom:foodinfrom(foodweight: "", foodplace: "", foodtime: "")),
             Oder(menu: Menu(ItemView: "AlfalfaSprouts", prise: "45", name: "苜蓿芽"), numbers: 9,infrom:foodinfrom(foodweight: "", foodplace: "", foodtime: "")),
             Oder(menu: Menu(ItemView: "Tofu", prise: "30", name: "豆腐"), numbers: 9,infrom:foodinfrom(foodweight: "", foodplace: "", foodtime: "")),
             Oder(menu: Menu(ItemView: "cucumber", prise: "55", name: "小黃瓜"), numbers: 9,infrom:foodinfrom(foodweight: "", foodplace: "", foodtime: ""))
         ]
        return tem //回傳
     }
 }
 */
