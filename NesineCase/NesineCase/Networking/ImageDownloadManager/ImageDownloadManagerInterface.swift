//
//  ImageDownloadManagerInterface.swift
//  NesineCase
//
//  Created by Can Kurtur on 14.05.2023.
//

import Foundation

protocol ImageDownloadManagerInterface {
    func downloadAndCategorizeImages(completion: @escaping (Result<(Data, ImageSizeCategory), ImageDownloadError>) -> Void) async
}
