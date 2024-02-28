//
//  ContentView.swift
//  SwiggyApplication
//
//  Created by Urvashi Tomar on 26/02/24.
//

import SwiftUI

/*
 Here is isPresentingModal is used for parent hild relation as when we tap on Popular dish view then it will update value and present child view named as BottomSheetBlurView and on changing same value from child it will dismiss child
 */
struct ContentView: View {
    
    @State var isPresentingModal = false
    @State var tappedDish: DishModel?
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    location
                    searchField
                    Text("Hey foodie whats your Mood night now!")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    moodRowView
                    Text("Get it Quickl")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    dishesRowView
                    Text("Popular Food & Restaurants to Explore")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    popularDishView
                }
                .padding()
                
            }
            /*
             here we are making changes to show Half bottom sheet when value of isPresentingModal changed, and adding color opacity to show transparent half screen of parent view and also add height for child view that how much size you want to show to present bottom half sheet
             */
            if isPresentingModal {
                Color.black
                    .opacity(0.7) // Adjust the opacity here
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isPresentingModal.toggle()
                    }
                
                BottomSheetBlurView( isPresentingModal: $isPresentingModal, dish: tappedDish ?? AppModel.popularDishesSource[0]).padding(.bottom, 0)
            }
        }
    }
    
    var location: some View {
        HStack {
            Image("location")
                .resizable()
                .frame(width: 20, height: 20)
            Text("Choose location")
                .fontWeight(.bold)
            Image("down")
                .resizable()
                .frame(width: 20, height: 20)
            Spacer()
            Image("profile")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
    
    var searchField: some View {
        HStack {
            Text("Search for dishes and restaurants")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .padding(.leading)
            Spacer()
            Image("search")
                .resizable()
                .frame(width: 20 ,height: 20)
            Divider()
            Image("mic")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing)
            
        }
        .frame(height: 40)
        .background(Color(red: 211/225, green: 211/225, blue: 211/225))
        
    }
    
    var moodRowView: some View {
        ScrollView(.horizontal,showsIndicators:false){
            HStack(content: {
                ForEach(0..<AppModel.appMoodSource.count, id: \.self) { i in
                    CircleImage(image: AppModel.appMoodSource[i])
                }
            })
        }
    }
    
    var dishesRowView: some View {
        ScrollView(.horizontal,showsIndicators:false){
            HStack(spacing: 15,content: {
                ForEach(0..<AppModel.dishSource.count, id: \.self) { i in
                    DishView(dish: AppModel.dishSource[i])
                }
            })
        }
    }
    
    var popularDishView: some View {
        VStack(spacing: 15,content: {
            ForEach(0..<AppModel.popularDishesSource.count, id: \.self) { i in
                PopularFoodView(dish: AppModel.popularDishesSource[i]).onTapGesture {
                    tappedDish = AppModel.popularDishesSource[i]
                    withAnimation {
                        isPresentingModal.toggle()
                        
                    }
                }
            }
        })
    }
    
}

#Preview {
    ContentView()
}
