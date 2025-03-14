//
//  AffirmationAPI.swift
//  LetGo
//
//  Created by Eva Madarasz on 24/02/2025.
//

import Foundation
import Combine

// MARK: - Protocol & Extension

protocol URLSessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

//  Affirmation Model
struct Affirmation: Codable, Identifiable {
    var id = UUID()
    let text: String
}

class AffirmationAPIService: ObservableObject {
    @Published var affirmation: Affirmation?

    func fetchAffirmation(for emotion: String) {
        guard let url = URL(string: "https://www.affirmations.dev/") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            if let decodedResponse = try? JSONDecoder().decode([String: String].self, from: data),
               let affirmationText = decodedResponse["affirmation"] {
                DispatchQueue.main.async {
                    self.affirmation = Affirmation(text: affirmationText)
                }
            } else {
                print("Failed to decode affirmation")
            }
        }.resume()
    }
}
