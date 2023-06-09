//
//  LocationSearchResultCell.swift
//  UberApp
//
//  Created by Nick Pavlov on 4/26/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                Text(subTitle)
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
        LocationSearchResultCell(title: "Starbucks", subTitle: "123 Main st")
    }
}
