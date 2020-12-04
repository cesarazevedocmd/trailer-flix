//
//  TrailerManager.swift
//  TrailerFlix
//
//  Created by César Alves de Azevedo on 04/12/20.
//

import Foundation

class TrailersManager {
    
    static let share = TrailersManager()
    
    var trailers: [Trailer]!
    
    private init(){
    }
    
    func loadTrailers(){
        let trailersURL = Bundle.main.url(forResource: "trailers", withExtension: "json")!
        do {
            let data = try Data(contentsOf: trailersURL)
            trailers = try JSONDecoder().decode([Trailer].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getTrailer(_ index: Int) -> Trailer {
        return trailers[index]
    }
    
    func getRandomTrailer() -> Trailer {
        let index = Int(arc4random_uniform(UInt32(trailers.count)))
        return getTrailer(index)
    }
}
