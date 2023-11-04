//
//  Model.swift
//  5thMission
//
//  Created by 정호진 on 10/30/23.
//

import Foundation

// MARK: - Welcome
struct Model: Codable {
    let header: Header?
    let body: [Body]?
}

// MARK: - Body
struct Body: Codable {
    let rstrID: Int?
    let rstrNm: String?
    let brnchNm, roadNmAddr: String?
    let lotnoAddr, rstrLat, rstrLot: String?
    let rstrRprsTelno: String?
    let bizCrtfctBzstatNm: BizCrtfctBzstatNm?
    let bizLcpmtNm: BizLcpmtNm?
    let rstrExplnCN: String?

    enum CodingKeys: String, CodingKey {
        case rstrID = "RSTR_ID"
        case rstrNm = "RSTR_NM"
        case brnchNm = "BRNCH_NM"
        case roadNmAddr = "ROAD_NM_ADDR"
        case lotnoAddr = "LOTNO_ADDR"
        case rstrLat = "RSTR_LAT"
        case rstrLot = "RSTR_LOT"
        case rstrRprsTelno = "RSTR_RPRS_TELNO"
        case bizCrtfctBzstatNm = "BIZ_CRTFCT_BZSTAT_NM"
        case bizLcpmtNm = "BIZ_LCPMT_NM"
        case rstrExplnCN = "RSTR_EXPLN_CN"
    }
}

enum BizCrtfctBzstatNm: String, Codable {
    case 기타 = "기타"
    case 베이커리카페 = "베이커리,카페"
    case 양식 = "양식"
    case 일식 = "일식"
    case 중식 = "중식"
    case 중식한식 = "중식,한식"
    case 카페 = "카페"
    case 한식 = "한식"
}

enum BizLcpmtNm: String, Codable {
    case 일반음식점 = "일반음식점"
    case 제과점영업 = "제과점영업"
    case 휴게음식점 = "휴게음식점"
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String?
    let numOfRows, pageNo, totalCount: Int?
}
