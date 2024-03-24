//
//  Model.swift
//  toDoList
//
//  Created by Валерия Новикова on 22/03/2024.
//

import Foundation
import UserNotifications
import UIKit

var toDoItems: [[String : Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "toDoDataKey")
        UserDefaults.standard.synchronize()
        setBadge()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "toDoDataKey") as? [[String : Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem (item: String, isCompleted: Bool = false) {
    toDoItems.append(["Name": item, "isCompleted": isCompleted])
}

func deleteItem(at id: Int) {
    toDoItems.remove(at: id)
}

func changeState(at id: Int) -> Bool {
    toDoItems[id]["isCompleted"] = !(toDoItems[id]["isCompleted"] as! Bool)
    return toDoItems[id]["isCompleted"] as! Bool
}

func moveItem(from: Int, to: Int) {
    let moveItem = toDoItems[from]
    toDoItems.remove(at: from)
    toDoItems.insert(moveItem, at: to)
}

func requestForNotificatios() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { isEnabled, error in
        if isEnabled {
            print("Согласие получено")
        } else {
            print("Согласие не получено")
        }
    }
}

func setBadge() {
    var badgeCount = 0
    for item in toDoItems {
        if item["isCompleted"] as! Bool == false { badgeCount += 1 }
    }
    
    UNUserNotificationCenter.current().setBadgeCount(badgeCount)
}
