//
//  Model.swift
//  SwiggyApplication
//
//  Created by Urvashi Tomar on 26/02/24.
//

import Foundation
import SwiftUI


class AppModel {
    static var appMoodSource = ["angry", "shy", "sad","smile"]
    static var dishSource = [DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish1"), DishModel(percentOff: "40 % OFF", cafeName: "Royal Kitchen", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish2"), DishModel(percentOff: "40 % OFF", cafeName: "Star House", deliveryTime: "20-25 mins", category: "South Indian", picture: "DIsh3"), DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish4")]
    
    static var popularDishesSource = [DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "3.1 (14k+) - 32 mins", category: "South Indian", picture: "Dish4", mood: "smile"), DishModel(percentOff: "40 % OFF", cafeName: "Royal Kitchen", deliveryTime: "3.1 (14k+) - 32 mins", category: "South Indian", picture: "c2", mood: "smile"), DishModel(percentOff: "40 % OFF", cafeName: "Star House", deliveryTime: "3.1 (14k+) - 32 mins", category: "South Indian", picture: "c3", mood: "shy"), DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "3.1 (14k+) - 32 mins", category: "South Indian", picture: "c4", mood: "smile")]
    
}

struct DishModel {
    var percentOff: String
    var cafeName: String
    var deliveryTime: String
    var category: String
    var picture: String
    var mood: String?
}


