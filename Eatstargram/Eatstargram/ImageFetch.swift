//
//  ImageFetch.swift
//  Eatstargram
//
//  Created by 박준영 on 8/27/24.
//

import Foundation

import UIKit

extension UIImage {
    static func fetchImage(from posterURL: String) async throws -> UIImage {
        guard let url = URL(string: posterURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //HTTP 응답 상태 코드 확인
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        //이미지 데이터 변환 코드
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "ImageError", code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to create image from data"])
        }
        
        return image
    }
}
