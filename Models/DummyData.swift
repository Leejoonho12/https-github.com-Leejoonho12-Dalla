import Foundation
import UIKit
import SwiftyJSON

class TopBannerData {
    
    var topBannerScrollData = ScrollViewData(length: 0)
    
}

class TopTenData {
    
    var rankingImage: [UIImage] = [UIImage(named: "number_W-1") ?? UIImage(),
                                   UIImage(named: "number_W-2") ?? UIImage(),
                                   UIImage(named: "number_W-3") ?? UIImage(),
                                   UIImage(named: "number_W-4") ?? UIImage(),
                                   UIImage(named: "number_W-5") ?? UIImage(),
                                   UIImage(named: "number_W-6") ?? UIImage(),
                                   UIImage(named: "number_W-7") ?? UIImage(),
                                   UIImage(named: "number_W-8") ?? UIImage(),
                                   UIImage(named: "number_W-9") ?? UIImage(),
                                   UIImage(named: "number_W-10") ?? UIImage(),]
    
    var bjTopTen: [TopTenContent] = [TopTenContent(liveType: .radio, ranking: 0, image: UIImage(named: "태연") ?? UIImage(), nick: "달대리찡"),
                                     TopTenContent(liveType: .video, ranking: 1, image: UIImage(named: "태연2") ?? UIImage(), nick: "사랑이M"),
                                     TopTenContent(liveType: .video, ranking: 2, image: UIImage(named: "태연3") ?? UIImage(), nick: "애나"),
                                     TopTenContent(liveType: .radio, ranking: 3, image: UIImage(named: "gpt") ?? UIImage(), nick: "gpt"),
                                     TopTenContent(liveType: .video, ranking: 4, image: UIImage(named: "태연") ?? UIImage(), nick: "달라쑝"),
                                     TopTenContent(liveType: .radio, ranking: 5, image: UIImage(named: "태연2") ?? UIImage(), nick: "쏭디제이"),
                                     TopTenContent(liveType: .radio, ranking: 6, image: UIImage(named: "태연3") ?? UIImage(), nick: "삐아"),
                                     TopTenContent(liveType: .radio, ranking: 7, image: UIImage(named: "gpt") ?? UIImage(), nick: "제플린"),
                                     TopTenContent(liveType: .video, ranking: 8, image: UIImage(named: "태연") ?? UIImage(), nick: "스냅킷"),
                                     TopTenContent(liveType: .radio, ranking: 9, image: UIImage(named: "태연2") ?? UIImage(), nick: "알라모파이어")]
    
    var fanTopTen: [TopTenContent] = [TopTenContent(liveType: .video, ranking: 0, image: UIImage(named: "태연3") ?? UIImage(), nick: "애나"),
                                      TopTenContent(liveType: .radio, ranking: 1, image: UIImage(named: "태연") ?? UIImage(), nick: "달대리찡"),
                                      TopTenContent(liveType: .radio, ranking: 2, image: UIImage(named: "gpt") ?? UIImage(), nick: "gpt"),
                                      TopTenContent(liveType: .video, ranking: 3, image: UIImage(named: "태연2") ?? UIImage(), nick: "사랑이M"),
                                      TopTenContent(liveType: .video, ranking: 4, image: UIImage(named: "태연") ?? UIImage(), nick: "달라쑝"),
                                      TopTenContent(liveType: .radio, ranking: 5, image: UIImage(named: "태연2") ?? UIImage(), nick: "쏭디제이"),
                                      TopTenContent(liveType: .radio, ranking: 6, image: UIImage(named: "태연3") ?? UIImage(), nick: "삐아"),
                                      TopTenContent(liveType: .radio, ranking: 7, image: UIImage(named: "gpt") ?? UIImage(), nick: "제플린"),
                                      TopTenContent(liveType: .video, ranking: 8, image: UIImage(named: "태연") ?? UIImage(), nick: "스냅킷"),
                                      TopTenContent(liveType: .radio, ranking: 9, image: UIImage(named: "태연2") ?? UIImage(), nick: "알라모파이어")]
    
    var teamTopTen: [TopTenContent] = [TopTenContent(liveType: .radio, ranking: 0, image: UIImage(named: "gpt") ?? UIImage(), nick: "gpt"),
                                       TopTenContent(liveType: .video, ranking: 1, image: UIImage(named: "태연3") ?? UIImage(), nick: "애나"),
                                       TopTenContent(liveType: .video, ranking: 2, image: UIImage(named: "태연2") ?? UIImage(), nick: "사랑이M"),
                                       TopTenContent(liveType: .radio, ranking: 3, image: UIImage(named: "태연") ?? UIImage(), nick: "달대리찡"),
                                       TopTenContent(liveType: .video, ranking: 4, image: UIImage(named: "태연") ?? UIImage(), nick: "달라쑝"),
                                       TopTenContent(liveType: .radio, ranking: 5, image: UIImage(named: "태연2") ?? UIImage(), nick: "쏭디제이"),
                                       TopTenContent(liveType: .radio, ranking: 6, image: UIImage(named: "태연3") ?? UIImage(), nick: "삐아"),
                                       TopTenContent(liveType: .radio, ranking: 7, image: UIImage(named: "gpt") ?? UIImage(), nick: "제플린"),
                                       TopTenContent(liveType: .video, ranking: 8, image: UIImage(named: "태연") ?? UIImage(), nick: "스냅킷"),
                                       TopTenContent(liveType: .radio, ranking: 9, image: UIImage(named: "태연2") ?? UIImage(), nick: "알라모파이어")]
    
}

class EventBannerData {
    
    var eventBannerScrollData = ScrollViewData(length: 6)
    
    var eventViewHide: Bool = true
    
    var eventBannerImage: [EventBannerContent] = [EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 1),
                                                   EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 2),
                                                   EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 1),
                                                   EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 2),
                                                   EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 1),
                                                   EventBannerContent(image: UIImage(named: "02-배너") ?? UIImage(), index: 2)]
}



enum ScrollDirection {
    case right
    case left
    case none
}

enum LiveType {
    case radio
    case video
}

struct EventBannerContent {
    var image: UIImage
    var index: Int
}

struct TopTenContent {
    var liveType: LiveType
    var ranking: Int
    var image: UIImage
    var nick: String
}

class ScrollViewData {
    var page: Int = 2 {
        didSet {
            changed = false
        }
    }
    
    var scrollDirection: ScrollDirection = .none
    
    var changed: Bool = false
    
    var firstLength: Int
    
    init(length: Int) {
        self.firstLength = length
    }
}

protocol ScrollViewModel {
    func appendData()
    func insertData()
    func nextEditData()
    func editData(direction: ScrollDirection)
    func getScrollDataCount() -> Int
}
