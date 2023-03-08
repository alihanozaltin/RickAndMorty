//
//  Service.swift
//  RickyMortyWithAlbooren
//
//  Created by Alihan Özaltın on 7.03.2023.
//

import Alamofire

enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
  
    static func characterPath() -> String {
       return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortiyeService {
    func fetchAllDatas(response:@escaping ([Result]?) -> Void)
    
}

struct RickyMortyService: IRickyMortiyeService {
    func fetchAllDatas(response:@escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self){ (model) in
            guard let data = model.value else {
                // error
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
