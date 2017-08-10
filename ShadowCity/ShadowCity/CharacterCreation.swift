//
//  CharacterCreation.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/10/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import Foundation
import Alamofire

public struct RaceChoice {
    public let name: String
    public let description: String
    public let id: Int
    
    public init(name: String, description: String, id: Int) {
        self.name = name
        self.description = description
        self.id = id
    }
}

public enum StatName: String {
    case strength = "str"
    case dexterity = "dex"
    case intelligence = "int"
    case charisma = "cha"
    case constitution = "con"
    case wisdom = "wis"
}

public struct Stats {
    public var stats = [StatName: Int]()
    
    public func getStat(named: StatName) -> Int {
        return stats[named] ?? 0
    }
}

public struct CharacterCreation {
    static let rollStatsUrl = "http://127.0.0.1:8000/actors/roll_stats/"
    
    public static func getRaceChoices() -> [RaceChoice] {
        var choices = [RaceChoice]()
        return choices
    }
    
    public static func rollStats(completion: @escaping ([StatName: Int]) -> Void) {
        var stats = [StatName: Int]()
        Alamofire.request(CharacterCreation.rollStatsUrl).responseJSON { response in
            if let json = response.result.value as? [String: Any] {
                for (k, v) in json {
                    if let name = StatName.init(rawValue: k),
                        let val = v as? Int{
                        stats[name] = val
                    }
                }
            }
            
            completion(stats)
        }
    }
}
