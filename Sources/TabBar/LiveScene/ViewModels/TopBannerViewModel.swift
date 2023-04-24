import Foundation
import UIKit
import SwiftyJSON

class TopBannerViewModel: ScrollViewModel {

    var scrolldata = TopBannerContentData()
    
    var dummyData = TopBannerData()
    
    func getScrollData() -> [MyBannerData] {
        return scrolldata.data
    }
    
    func getScrollDataCount() -> Int {
        return scrolldata.data.count
    }
    
    func editData(direction: ScrollDirection) {
        var newDataSource: [MyBannerData] = []
        switch direction {
        case .left:
            for i in 0..<scrolldata.data.count {
                if i < dummyData.topBannerScrollData.firstLength {
                    newDataSource.append(scrolldata.data[i])
                }
            }
            scrolldata.data = newDataSource
        case .right:
            for i in 0..<scrolldata.data.count {
                if i > scrolldata.data.count - (dummyData.topBannerScrollData.firstLength + 1) {
                    newDataSource.append(scrolldata.data[i])
                }
            }
            scrolldata.data = newDataSource
        case .none:
            print("")
        }
    }
    
    func nextEditData() {
        var newDataSource: [MyBannerData] = []
        
        for i in 0..<scrolldata.data.count {
            if i > scrolldata.data.count - (dummyData.topBannerScrollData.firstLength + 1) {
                newDataSource.append(scrolldata.data[i])
            }
        }
        
        scrolldata.data = newDataSource
    }
    
    func appendData() {
        scrolldata.data.append(scrolldata.data[scrolldata.data.count - (dummyData.topBannerScrollData.firstLength - 4)])
    }
    
    func insertData() {
        scrolldata.data.insert(scrolldata.data[dummyData.topBannerScrollData.firstLength - 5], at: 0)
    }
    
    func dataSetting(model: JSON) {
        for (_, subJson): (String, JSON) in model {
            scrolldata.data.append(MyBannerData(userNick: subJson["mem_nick"].stringValue,
                                                liveTitle: subJson["title"].stringValue,
                                                badgeSpecial: subJson["badgeSpecial"].intValue,
                                                profileImage: subJson["image_profile"].stringValue))
        }
        scrolldata.data.append(scrolldata.data[0])
        scrolldata.data.append(scrolldata.data[1])
        scrolldata.data.insert(scrolldata.data[scrolldata.data.count - 1], at: 0)
        scrolldata.data.insert(scrolldata.data[scrolldata.data.count - 2], at: 0)
        dummyData.topBannerScrollData.firstLength = scrolldata.data.count
    }
}
