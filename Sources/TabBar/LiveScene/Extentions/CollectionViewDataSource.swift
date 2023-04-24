import Foundation
import UIKit
import SwiftyJSON

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCell.id, for: indexPath) as? TopBannerCell else { return UICollectionViewCell() }
            
            let data = topBannerViewModel.getScrollData() // 뱃지 지금은 고정이지만
            cell.configure(banner: data[indexPath.row].profileImage,
                           title: data[indexPath.row].liveTitle,
                           user: data[indexPath.row].userNick)
            
            return cell
            
        } else if collectionView == mainView.myBJListCollentionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyBJCell.id, for: indexPath) as? MyBJCell else { return UICollectionViewCell() }
            
            cell.configure(img: topBannerViewModel.getScrollData().first?.profileImage ?? "",
                           user: topBannerViewModel.getScrollData().first?.userNick ?? "")
            
            return cell
            
        } else if collectionView == mainView.eventCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.id, for: indexPath) as? EventCell else { return UICollectionViewCell() }
            
            cell.eventBannerImage.image = eventBannerViewModel.dummyData.eventBannerImage[indexPath.row].image
            cell.index = eventBannerViewModel.dummyData.eventBannerImage[indexPath.row].index
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.bannerCollectionView {
            
            return topBannerViewModel.getScrollData().count
            
        } else if collectionView == mainView.myBJListCollentionView {
            
            return 10
            
        } else if collectionView == mainView.eventCollectionView {
            
            return eventBannerViewModel.dummyData.eventBannerImage.count
            
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.bannerCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if collectionView == mainView.eventCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        }
        
        return CGSize()
    }

}
