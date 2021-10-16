//
//  Rocket.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rocket = try? newJSONDecoder().decode(Rocket.self, from: jsonData)

import Foundation

// MARK: - Rocket
struct Rocket: Codable {
    var height, diameter: Diameter?
    var mass: Mass?
    var firstStage: FirstStage?
    var secondStage: SecondStage?
    var engines: Engines?
    var landingLegs: LandingLegs?
    var payloadWeights: [PayloadWeight]?
    var flickrImages: [String]?
    var name: String?
    var type: String?
    var active: Bool?
    var stages, boosters, costPerLaunch, successRatePct: Int?
    var firstFlight, country, company: String?
    var wikipedia: String?
    var rocketDescription, id: String?

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia
        case rocketDescription = "description"
        case id
    }
}

// MARK: - Diameter
struct Diameter: Codable {
    var meters, feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    var isp: ISP?
    var thrustSeaLevel, thrustVacuum: Thrust?
    var number: Int?
    var type, version, layout: String?
    var engineLossMax: Int?
    var propellant1, propellant2: String?
    var thrustToWeight: Double?

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Codable {
    var seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    var kN, lbf: Int?
}

// MARK: - FirstStage
struct FirstStage: Codable {
    var thrustSeaLevel, thrustVacuum: Thrust?
    var reusable: Bool?
    var fuelAmountTons: Double?
    var engines, burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    var number: Int?
    var material: String?
}

// MARK: - Mass
struct Mass: Codable {
    var kg, lb: Int?
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    var id, name: String?
    var kg, lb: Int?
}

// MARK: - SecondStage
struct SecondStage: Codable {
    var thrust: Thrust?
    var payloads: Payloads?
    var reusable: Bool?
    var fuelAmountTons: Double?
    var engines, burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    var compositeFairing: CompositeFairing?
    var option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    var height, diameter: Diameter?
}
