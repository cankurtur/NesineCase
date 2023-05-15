//
//  Config.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

private enum Keys: String {
    case iTunesBaseURL
    case searchMediaType
}

final class Config: NSObject {
  
    static let shared: Config = Config()
    
    private var configs: NSDictionary!
    
    override private init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Config")!
        let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
        configs = (NSDictionary(contentsOfFile: path)!.object(forKey: currentConfiguration) as! NSDictionary)
    }
}

extension Config {
    var iTunesBaseURL: String {
        return configs.object(forKey: Keys.iTunesBaseURL.rawValue) as! String
    }
    
    var searchMediaType: String {
        return configs.object(forKey: Keys.searchMediaType.rawValue) as! String
    }
}
