//
//  Coins-Explorer+Double.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 30/8/20.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func formattedPercent(toPlaces places: Int) -> String {
        "\(rounded(toPlaces: places))%"
    }
}
