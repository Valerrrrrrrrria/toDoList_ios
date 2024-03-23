//
//  Model.swift
//  toDoList
//
//  Created by Валерия Новикова on 22/03/2024.
//

import Foundation

var toDoItems: [[String : Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "toDoDataKey")
        UserDefaults.standard.synchronize()
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
