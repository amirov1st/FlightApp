//
//  HomeScreenView.swift
//  FlightApp
//
//  Created by Amirov Foma on 14.06.2024.
//

import SwiftUI

enum Route {
    case arrivals
    case departures
    case timeline
    
    var title: String {
        switch self {
        case .arrivals:
            "Arrivals"
        case .departures:
            "Departures"
        case .timeline:
            "Flight Timeline"
        }
    }
}

struct HomeScreenView: View {
    private let flights = FlightInformation.generateFlights()
    
    private var arrivals: [FlightInformation] {
        flights.filter {
            $0.direction == .arrival
        }
    }
    
    private var departures: [FlightInformation] {
        flights.filter {
            $0.direction == .departure
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading, spacing: 20) {
                    NavigationLink(Route.arrivals.title, value: Route.arrivals)
                    NavigationLink(Route.departures.title, value: Route.departures)
                    NavigationLink(Route.timeline.title, value: Route.timeline)
                    
                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .arrivals:
                    FlightBoardView(boardName: Route.arrivals.title, flights: arrivals)
                case .departures:
                    FlightBoardView(boardName: Route.departures.title, flights: departures)
                case .timeline:
                    TimelineView(flights: flights)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
