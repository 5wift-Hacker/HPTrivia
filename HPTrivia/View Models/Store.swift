//
//  Store.swift
//  HPTrivia
//
//  Created by John Newman on 7/11/2025.
//

import StoreKit

@MainActor
@Observable
class Store {
    var products: [Product] = []
    var purchased = Set<String>()
    
    private var updates: Task<Void, Never>? = nil
    
    init() {
        updates = watchForUpdates()
    }
    
    // load available products
    func loadProducts() async {
        do {
            products = try await Product.products(for: ["hp4", "hp5", "hp6", "hp7"])
            products.sort { $0.displayName < $1.displayName }
        } catch {
            print("unable to load products \(error)")
        }
    }
    
    // purchase a product
    func purchase(_ product: Product) async {
        do {
            let result = try await product.purchase()
            
            switch result {
                // purchase successful. but now verify receipt and transaction
            case .success(let verificationResult):
                switch verificationResult {
                case .unverified(let signedType, let verificationError):
                    print("Error on \(signedType): \(verificationError)")
                case .verified(let signedType):
                    purchased.insert(signedType.productID)
                    
                    await signedType.finish()
                }
                
                // user cancelled or parent disapproved child's purchase request
            case .userCancelled:
                break
                
                // waiting for some sort of approval
            case .pending:
                break
                
                //catches potential future options or anything else
            @unknown default:
                break
            }
        } catch {
            print("unable to purchase product \(error)")
        }
    }
    
    // check for purchased products
    private func checkPurchased() async {
        for product in products {
            // do we have any transaction data at all?
            guard let status = await product.currentEntitlement else { continue }
            
            switch status {
            case .unverified(let signedType, let verificationError):
                print("Error on \(signedType): \(verificationError)")
            case .verified(let signedType):
                if signedType.revocationDate == nil {
                    purchased.insert(signedType.productID)
                }else {
                    purchased.remove(signedType.productID)
                }
            }
        }
    }
    
    // connect with app store to watch for purchase and transaction updates
    private func watchForUpdates() -> Task<Void, Never> {
        Task(priority: .background) {
            for await _ in Transaction.updates {
                await checkPurchased()
            }
        }
    }
}
