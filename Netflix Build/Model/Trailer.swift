//
//  Trailer.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/23.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
