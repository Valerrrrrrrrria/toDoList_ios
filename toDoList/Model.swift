//
//  Model.swift
//  toDoList
//
//  Created by Валерия Новикова on 22/03/2024.
//

import Foundation

var toDoItems: [[String : Any]] = [["Name": "Дописать песню", "isCompleted": true ],
                                   ["Name": "Забронировать созвон с Алисой", "isCompleted": false]]

func addItem (item: String, isCompleted: Bool = false) {
    toDoItems.append(["Name": item, "isCompleted": isCompleted])
    saveData()
}

func deleteItem(at id: Int) {
    toDoItems.remove(at: id)
    saveData()
}

func changeState(at id: Int) -> Bool {
    toDoItems[id]["isCompleted"] = !(toDoItems[id]["isCompleted"] as! Bool)
    saveData()
    return toDoItems[id]["isCompleted"] as! Bool
}

func saveData() {
    
}

func loadData() {
    
}
