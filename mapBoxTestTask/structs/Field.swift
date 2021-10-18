// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let field = try? newJSONDecoder().decode(Field.self, from: jsonData)

import Foundation

// MARK: - Field
struct Field: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let fieldName, fieldCadastralNumber: String
    let fieldLon, fieldLat: Double
    let fieldPoly: [[Double]]
    let fieldStatus: Int
    let fieldSquare: Double
    let geosysActive: Bool
    let lastCheckDate: Int
    let householdInfo: HouseholdInfo
    let currentCrop: CurrentCrop
    let prevCrop: [PrevCrop]?
    let agronomAnswer: AgronomAnswer
    let intersectingFields, lastNdvi: JSONNull?
    let uncheckedMessages: Bool
    let lastMessageSendDate: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case fieldName = "field_name"
        case fieldCadastralNumber = "field_cadastral_number"
        case fieldLon = "field_lon"
        case fieldLat = "field_lat"
        case fieldPoly = "field_poly"
        case fieldStatus = "field_status"
        case fieldSquare = "field_square"
        case geosysActive = "geosys_active"
        case lastCheckDate = "last_check_date"
        case householdInfo = "household_info"
        case currentCrop = "current_crop"
        case prevCrop = "prev_crop"
        case agronomAnswer = "agronom_answer"
        case intersectingFields = "intersecting_fields"
        case lastNdvi = "last_ndvi"
        case uncheckedMessages = "unchecked_messages"
        case lastMessageSendDate = "last_message_send_date"
    }
}

// MARK: - AgronomAnswer
struct AgronomAnswer: Codable {
    let answerText: String
    let answerRating, answerDate: Int

    enum CodingKeys: String, CodingKey {
        case answerText = "answer_text"
        case answerRating = "answer_rating"
        case answerDate = "answer_date"
    }
}

// MARK: - CurrentCrop
struct CurrentCrop: Codable {
    let cropID: Int
    let cropName, cropSort: String
    let seedingDate: Int

    enum CodingKeys: String, CodingKey {
        case cropID = "crop_id"
        case cropName = "crop_name"
        case cropSort = "crop_sort"
        case seedingDate = "seeding_date"
    }
}

// MARK: - HouseholdInfo
struct HouseholdInfo: Codable {
    let id: Int
    let name: Name
    let shortName: ShortName
    let fieldCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case shortName = "short_name"
        case fieldCount = "field_count"
    }
}

enum Name: String, Codable {
    case татарстан = "Татарстан"
}

enum ShortName: String, Codable {
    case татФерм = "ТатФерм"
}

// MARK: - PrevCrop
struct PrevCrop: Codable {
    let historyCropID: Int
    let cropName, cropSort: String
    let growthDateStart, growthDateFinish: Int

    enum CodingKeys: String, CodingKey {
        case historyCropID = "history_crop_id"
        case cropName = "crop_name"
        case cropSort = "crop_sort"
        case growthDateStart = "growth_date_start"
        case growthDateFinish = "growth_date_finish"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

