//
//  PopularFoodView.swift
//  SwiggyApplication
//
//  Created by Urvashi Tomar on 26/02/24.
//

import SwiftUI

struct PopularFoodView: View {
    
    var dish: DishModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(dish.picture)
                .resizable()
                .frame(width: 140, height: 170)
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(dish.cafeName)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                HStack{
                    Image(dish.mood ?? "")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(dish.deliveryTime)
                        .font(.system(size: 15))
                    
                }
                Text("South Indian")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    PopularFoodView(dish: DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish2", mood: "smile"))
}
