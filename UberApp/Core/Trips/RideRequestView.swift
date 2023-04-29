//
//  RideRequestView.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/27/23.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // trip info view
            HStack {
                
                // indicator view
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(viewModel.pickUpTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        if let location = viewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        Text(viewModel.dropOffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            // ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text(viewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding()
                        }
                        .frame(width: 120, height: 140)
                        .foregroundColor(type == selectedRideType ? .white: Color.theme.primaryTextColor)
                        .background(type == selectedRideType ? .blue: Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.2: 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            // payment option view
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .bold()
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding()
            }
            .frame(height: 50)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride button
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .bold()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 25)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
            .environmentObject(LocationSearchViewModel())
    }
}
