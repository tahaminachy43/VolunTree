//
//  OpportunityCard.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-04-08.
//

import SwiftUI

struct OpportunityCard: View {
    let opportunity: VolunteeringOpportunity

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(opportunity.name)
                .font(.headline)
                .foregroundColor(.darkColor)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(opportunity.volunteeringTypes, id: \.self) { type in
                        Text(type)
                            .font(.caption2)
                            .padding(5)
                            .background(Color.darkColor)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
        }
        .padding()
        .frame(width: 150, height: 100)
        .background(Color.lightGreen)
        .cornerRadius(10)
    }
}

#Preview {
    HomePage()
}
