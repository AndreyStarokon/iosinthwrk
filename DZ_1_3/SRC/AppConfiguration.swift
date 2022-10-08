//
//  AppConfiguration.swift
//  VK_app
//
//  Created by Ffhh Qerg on 12.07.2022.
//

import Foundation


enum AppConfiguration {
        case people(people: URL)
        case starships(starsip: URL)
        case planets(planet: URL)
        
        static func random(people: URL, starships: URL, planet: URL) -> AppConfiguration {
            let all: [AppConfiguration] = [.people(people: people),
                                           .starships(starsip: starships),
                                           .planets(planet: planet)]
            let randomIndex = Int(arc4random()) % all.count
            return all[randomIndex]
        }
}

