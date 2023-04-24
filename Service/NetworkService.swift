import Foundation
import SwiftyJSON
import Alamofire

class ApiService {
    static let shared = ApiService()
    
    func getResponseValue(requestType: RequestEnum, completion: @escaping ((Result<JSON, Error>) -> ()) = { _ in }) -> Void {
        let request = AF.request(requestType.url)
        request.validate(statusCode: 200...299)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let parsingJson = JSON(data)
                    let bannerList = parsingJson["BannerList"]
                    completion(.success(bannerList))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    //필요한 정보를 세팅한 urlrequest를 반환
    private func makeRequest(requestType: RequestEnum) -> URLRequest {
        var request = URLRequest(url: requestType.url)
        
        request.httpMethod = requestType.method
        if requestType.method == "POST" {
            _ = requestType.headers.map { request.setValue($0.value, forHTTPHeaderField: $0.field) }
            request.httpBody = try? JSONSerialization.data(withJSONObject: requestType.body)
        }
        
        
        return request
    }
    
    
    //리퀘스트 정보를 api별로 정리한 열거형
    enum RequestEnum {
        typealias HeaderType = (value: String?, field: String)
        typealias BodyType = [String : Any]
        
        case chatGpt(String)
        case requestDallaBannerApi
        
        var url: URL {
            switch self {
            case .chatGpt:
                return URL(string: "https://api.openai.com/v1/chat/completions")!
            case .requestDallaBannerApi:
                return URL(string: "http://61.80.148.23:3000/RqBannerList?pageNo=2")!
            }
        }
        
        var method: String {
            switch self {
            case .chatGpt:
                return HttpMethod.post
            case .requestDallaBannerApi:
                return HttpMethod.get
            }
        }
        
        var headers: [HeaderType] {
            switch self {
            case .chatGpt:
                return [("Bearer ", "Authorization"),
                        ("application/json", "Content-Type")]
            case .requestDallaBannerApi:
                return [("", "")]
            }
        }
        
        var body: BodyType {
            switch self {
            case .chatGpt(let data):
                return ["model": "gpt-3.5-turbo",
                        "messages": [["role": "user", "content": data]]]
            case .requestDallaBannerApi:
                return ["": ""]
            }
        }
    }


    enum HttpMethod {
        static let get = "GET"
        static let post = "POST"
    }

}

enum NetworkError: Error {
    case responseIsNil
    case statecodeIsNotNormal(String)
    case dataIsNil
    case failDecode
}


