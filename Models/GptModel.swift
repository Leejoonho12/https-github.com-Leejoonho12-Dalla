import Foundation

struct ChatGPTModel: Codable {
    let id: String
    let object: String
    let created: Int
    let choices: [Choice]
    let usage: Usage
}

struct Choice: Codable {
    let index: Int
    let message: Message
    let finishReason: String
    
    enum CodingKeys: String, CodingKey {
        case index, message
        case finishReason = "finish_reason"
    }
}

struct Usage: Codable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

struct Message: Codable {
    let role: String
    let content: String
}
