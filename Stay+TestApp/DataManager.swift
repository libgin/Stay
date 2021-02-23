//
//  DataManager.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation
import Moya

protocol DataManager {
    func obtainHotels(_ byIdD: String, completionBlock: @escaping ([Hotel]) -> ())    
}

class DataManagerImplementation: DataManager {
    
    func obtainHotels(_ byIdD: String, completionBlock: @escaping ([Hotel]) -> ())  {

        let provider = MoyaProvider<StayAPI>(plugins:[NetworkLoggerPlugin()])
        
        provider.request(.getHotels(cityID: byIdD)) { result in
           
            switch result {
                case .success(let response):
                    do {
                        let result = try JSONDecoder().decode(TopLevelData.self, from: response.data)
                        let hotels = result.data
                        completionBlock(hotels )
                    } catch  {
                       
                        print(error)
                    }
                case .failure(let moyaError):
                    print(moyaError)
            }
            
        }
    }
}
