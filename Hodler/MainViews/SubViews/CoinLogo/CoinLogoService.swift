//
//  CoinImageService.swift
//  Hodler
//
//  Created by Naji Achkar on 02/01/2022.
//

import Foundation
import SwiftUI
import Combine

class CoinLogoService: ObservableObject, NetworkService {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellable: AnyCancellable?
    let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
            print("Downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        self.isLoading = true
        cancellable = getData(baseURL: coin.imageURL, parameters: nil)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.isLoading = false
                self.cancellable?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
 
}




