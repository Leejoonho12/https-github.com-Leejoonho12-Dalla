import Foundation
import UIKit

class EventBannerViewModel: ScrollViewModel {
    
    var dummyData = EventBannerData()
    
    func getScrollDataCount() -> Int {
        return dummyData.eventBannerImage.count
    }
    
    func appendData() {
        //scrolldata.data.append(scrolldata.data[scrolldata.data.count - 3])
        dummyData.eventBannerImage.append(dummyData.eventBannerImage[dummyData.eventBannerImage.count - (dummyData.eventBannerScrollData.firstLength - 4)])
    }
    
    func insertData() {
        //scrolldata.data.insert(scrolldata.data[scrolldata.data.count - 5], at: 0)
        dummyData.eventBannerImage.insert(dummyData.eventBannerImage[dummyData.eventBannerScrollData.firstLength - 5], at: 0)
    }
    
    func nextEditData() {
        var newDataSource: [EventBannerContent] = []
        
        for i in 0..<dummyData.eventBannerImage.count {
            if i > dummyData.eventBannerImage.count - (dummyData.eventBannerScrollData.firstLength + 1) {
                newDataSource.append(dummyData.eventBannerImage[i])
            }
        }
        dummyData.eventBannerImage = newDataSource
    }
    
    func editData(direction: ScrollDirection) {
        var newDataSource: [EventBannerContent] = []
        switch direction {
        case .left:
            for i in 0..<dummyData.eventBannerImage.count {
                if i < dummyData.eventBannerScrollData.firstLength {
                    newDataSource.append(dummyData.eventBannerImage[i])
                }
            }
            dummyData.eventBannerImage = newDataSource
        case .right:
            for i in 0..<dummyData.eventBannerImage.count {
                if i > dummyData.eventBannerImage.count - (dummyData.eventBannerScrollData.firstLength + 1) {
                    newDataSource.append(dummyData.eventBannerImage[i])
                }
            }
            dummyData.eventBannerImage = newDataSource
        case .none:
            print("")
        }
    }
}
