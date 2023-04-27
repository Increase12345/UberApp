//
//  LocationSearchResultCell.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/26/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text("Starbucks Coffe")
                    .font(.body)
                Text("123 Main St, Cupertino CA")
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell()
    }
}
