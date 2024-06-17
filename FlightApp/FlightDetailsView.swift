//
//  FlightDetailsView.swift
//  FlightApp
//
//  Created by Amirov Foma on 14.06.2024.
//

import SwiftUI

struct FlightDetailsView: View {
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) - Flight \(flight.number)")
                    .font(.title)
                Spacer()
            }
            
            Text("\(flight.direction == .arrival ? "From: " : "To: ")\(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor))
            Spacer()
        }
        .font(.headline)
        .padding()
        .navigationTitle("Flight Details")
    }
}

#Preview {
    FlightDetailsView(flight: FlightInformation.generateFlight())
}
