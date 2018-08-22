//
//  IAPService.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation
import StoreKit

class IAPService: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    private override init() {}

    static let shared = IAPService()
    
    let IAP_AD_REMOVER = "com.grouchybartender.TaskBuddy2.AdRemover"
    
    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    
    func fetchProducts() {
        let productIdentifiers = NSSet(object: IAP_AD_REMOVER) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest.delegate = self
        productsRequest.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            print(response.products.debugDescription)
            products = response.products
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

    }

    
}
