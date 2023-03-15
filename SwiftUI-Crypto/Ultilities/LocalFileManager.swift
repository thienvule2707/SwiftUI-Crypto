//
//  LocalFileManager.swift
//  SwiftUI-Crypto
//
//  Created by Thien Vu Le on Mar/14/23.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // Create folder
        createFolderIfNeeded(folderName: folderName)
        
        // Get path for image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        // Save image
        do {
            try data.write(to: url)
        } catch let error {
            print("ERROR SAVING IMAGE: \(error), imageName: \(imageName)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path())
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("ERROR CREATING DIRECTORY: \(error). FolderName: \(folderName)")
            }
        }
    }
    
    private func getUrlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getUrlForFolder(folderName: folderName) else { return nil }
        
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
