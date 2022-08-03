//
//  Movie.swift
//  SwiftUI_Native_Interface
//
//  Created by Emre Dogan on 02/08/2022.
//

import Foundation


struct Movie: Hashable {
    let title: String
    let image: String
}

let movies: [Movie] = [
    Movie(title: "Hightown", image: "hightown"),
        Movie(title: "Penny Dreadful", image: "pennyDreadful"),
        Movie(title: "The Bold Type", image: "boldType"),
        Movie(title: "Blindspot", image:"blindspot"),
        Movie(title: "In the Dark", image: "inTheDark"),
        Movie(title: "Doom Patrol", image: "doomPatrol"),
        Movie(title: "Agents of S.H.I.E.L.D", image:"agentsOfShield"),
        Movie(title: "The 100", image: "theHundred"),
        Movie(title: "DC Legends of Tomorrow", image: "dcLegendsOfTomorrow"),
        Movie(title: "Siren", image: "siren")]
