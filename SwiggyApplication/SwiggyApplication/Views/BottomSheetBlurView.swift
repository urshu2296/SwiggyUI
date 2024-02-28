//
//  BottomSheetBlurView.swift
//  SwiggyApplication
//
//  Created by Urvashi Tomar on 27/02/24.
//

import SwiftUI

struct BottomSheetBlurView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPresentingModal: Bool
    
    var dish: DishModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                Divider()
                    .frame(width: 90, height: 5)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Personalize your Mood foods")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                PopularFoodView(dish: dish)
                    .padding(.leading, 0)
                Text("Similar to this")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<AppModel.dishSource.count, id: \.self) { i in
                            Image(AppModel.dishSource[i].picture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    .padding(.bottom, 5)
                }
            }
            .padding(.leading, 0)
            .background(colorScheme == .dark ? Color.black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
        }
        .onTapGesture {
            withAnimation {
                isPresentingModal.toggle()
                
            }
        }
    }
}

#Preview {
    BottomSheetBlurView(isPresentingModal: .constant(true), dish: DishModel(percentOff: "40 % OFF", cafeName: "Vitamin Cafe", deliveryTime: "20-25 mins", category: "South Indian", picture: "Dish2", mood: "smile"))
}
