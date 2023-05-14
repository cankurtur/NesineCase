//
//  ImageDownloadManager.swift
//  NesineCase
//
//  Created by Can Kurtur on 14.05.2023.
//

import Foundation

final class ImageDownloadManager: ImageDownloadManagerInterface {
    private var urls: [URL]
    private let maxConcurrentDownloads = 3

    init(urls: [URL]) {
        self.urls = urls
    }

    func downloadAndCategorizeImages(completion: @escaping (Result<(Data, ImageSizeCategory), ImageDownloadError>) -> Void) async {
        var currentDownloads = 0

        await withTaskGroup(of: (Data, ImageSizeCategory).self) { group in
            for url in urls {
                while currentDownloads >= maxConcurrentDownloads {
                    if let completedResult = await group.next() {
                        DispatchQueue.main.async {
                            completion(.success(completedResult))
                        }
                        currentDownloads -= 1
                    }
                }

                currentDownloads += 1

                group.addTask(priority: .high) {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        let imageSize = data.count
                        let category = ImageSizeCategory(size: imageSize)
                        return (data, category)
                    } catch {
                        print("Failed to download image: \(error)")
                        DispatchQueue.main.async {
                            completion(.failure(.downloadFailed))
                        }
                        return (Data(), .small)
                    }
                }
            }
            
            while let completedResult = await group.next() {
                DispatchQueue.main.async {
                    completion(.success(completedResult))
                }
            }
        }
    }
}

