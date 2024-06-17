//
//  FlightBoardView.swift
//  FlightApp
//
//  Created by Amirov Foma on 14.06.2024.
//

import SwiftUI

struct FlightBoardView: View {
    @State private var hiddenCanceled = false
    
    let boardName: String
    let flights: [FlightInformation]
    
    private var shownFlights: [FlightInformation] {
        hiddenCanceled
            ? flights.filter { $0.status != .cancelled }
            : flights
    }
    
    var body: some View {
        List(shownFlights) { flight in
            NavigationLink(destination: FlightDetailsView(flight: flight)) {
                FlightRowView(flight: flight)
            }
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Toggle("Hide cancelled", isOn: $hiddenCanceled)
            }
        }
    }
}

#Preview {
    FlightBoardView(boardName: "Flight Board", flights: FlightInformation.generateFlights())
}
