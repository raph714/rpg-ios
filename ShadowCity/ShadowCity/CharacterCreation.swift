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

public enum CreationStep: Int {
    case selectRace
    case selectClass
}

public struct BaseObject {
    let name: String
    let id: Int
    let desctription: String
}

public struct CharacterCreation {
    static var charData = [String: Any]()
    
    public static func rollStats(completion: @escaping ([StatName: Int]) -> Void) {
        var stats = [StatName: Int]()
        Alamofire.request(NetworkUrls.url(with: .rollStats)).responseJSON { response in
            if let json = response.result.value as? [String: Any] {
                for (k, v) in json {
                    if let name = StatName.init(rawValue: k),
                        let val = v as? Int{
                        stats[name] = val
                    }
                }
                
                //make sure we save this round in case the user likes it.
                update(data: json)
            }
            
            completion(stats)
        }
    }
    
    public static func update(data: [String: Any]) {
        for (k, v) in data {
            charData[k] = v
        }
    }
    
    public static func dataFor(step: CreationStep, completion: @escaping ([BaseObject]) -> Void) {
        var url = NetworkUrls.url(with: .listRaces)
        
        switch step {
        case .selectClass:
            url = NetworkUrls.url(with: .listClasses)
        default:
            break
        }
        
        Alamofire.request(url).responseJSON { response in
            var res = [BaseObject]()
            
            if let json = response.result.value as? [[String: Any]] {
                for item in json {
                    let obj = BaseObject(name: item["name"] as? String ?? "", id: item["id"] as? Int ?? 0, desctription: item["description"] as? String ?? "")
                    res.append(obj)
                }
            }
            
            completion(res)
        }
    }
    
    public static func completeCharCreation(completion: @escaping (NetworkResponse) -> Void) {
        
    }
}
