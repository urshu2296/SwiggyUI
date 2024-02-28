//
//  CircleImage.swift
//  SwiggyApplication
//
//  Created by Urvashi Tomar on 26/02/24.
//

import SwiftUI

struct CircleImage: View {
    
    var image: String?
    
    var body: some View {
        Image(image ?? "location")
            .resizable()
            .frame(width: 40, height: 40)
            .padding(5)
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color.red,
                        lineWidth: 1))
    }
}

struct DishView: View {
    
    var dish: DishModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            
            ZStack{
                Image(dish.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150,height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Text(dish.percentOff)
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .offset(x: -30, y: 80)
                    .foregroundStyle(.white)
                /*
                 here we used offset to position the  Text(dish.percentOff) on image so bydefault if we do not give any coordinate then it is placed at 0,0 then if we give like 10 then it willl move towards right with spacing 10, and -10 will be left side
                 
                 x will be measure horizontally
                 y will be measure vertically
                 
                 */
                
            }
            Text(dish.cafeName)
                .font(.system(size: 12))
                .fontWeight(.bold)
            
            Text(dish.deliveryTime)
                .font(.system(size: 12))
                .fontWeight(.bold)
            
            Text(dish.category)
                .foregroundStyle(.gray)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
        }
    }
}


#Preview {
    DishView(dish: DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish2"))
}
