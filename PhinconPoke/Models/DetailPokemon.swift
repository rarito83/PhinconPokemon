//
//  DetailPokemon.swift
//  PhinconPoke
//
//  Created by Rarito on 09/02/23.
//

import Foundation

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let moves: [Move]
    let types: [TypeElement]
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.move = try container.decode(Species.self, forKey: .move)
        self.versionGroupDetails = try container.decode([VersionGroupDetail].self, forKey: .versionGroupDetails)
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try container.decode(Int.self, forKey: .slot)
        self.type = try container.decode(Species.self, forKey: .type)
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        self.moveLearnMethod = try container.decode(Species.self, forKey: .moveLearnMethod)
        self.versionGroup = try container.decode(Species.self, forKey: .versionGroup)
    }
}

