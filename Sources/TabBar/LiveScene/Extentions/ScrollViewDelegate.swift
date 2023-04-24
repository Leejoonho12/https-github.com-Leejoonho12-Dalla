import Foundation
import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout {
    // 스크롤 이동 끝났을때. 자동스크롤시 호출되지 않는다.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mainView.bannerCollectionView {
            scrollEnd(scrollData: topBannerViewModel.dummyData.topBannerScrollData, viewModel: topBannerViewModel, scrollView: scrollView)
        } else if scrollView == mainView.eventCollectionView {
            scrollEnd(scrollData: eventBannerViewModel.dummyData.eventBannerScrollData, viewModel: eventBannerViewModel, scrollView: scrollView)
        } else if scrollView == mainView.mainScrollView {
            
        }
    }
    
    func scrollEnd<T: ScrollViewData>(scrollData: T, viewModel: ScrollViewModel, scrollView: UIScrollView) {
        if scrollData.page == 1 {
            scrollData.scrollDirection = .left
            viewModel.insertData()
        }
        viewModel.editData(direction: scrollData.scrollDirection)
        guard let collectionView = scrollView as? UICollectionView else { return }
        if scrollData.scrollDirection == .left {
            collectionView.reloadData()
            scrollView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * 2, y: scrollView.contentOffset.y), animated: false)
        } else if scrollData.scrollDirection == .right {
            collectionView.reloadData()
            scrollView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * CGFloat(scrollData.firstLength - 3), y: scrollView.contentOffset.y), animated: false)
        }
        scrollData.scrollDirection = .none
    }
    
    //스크롤중일때 계속 호출. 자동스크롤시에도 호출된다.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainView.bannerCollectionView {
            loopScroll(scrollData: topBannerViewModel.dummyData.topBannerScrollData, viewModel: topBannerViewModel, scrollView: scrollView)
        } else if scrollView == mainView.eventCollectionView {
            eventBannerTextSet(scrollView: scrollView)
            loopScroll(scrollData: eventBannerViewModel.dummyData.eventBannerScrollData, viewModel: eventBannerViewModel, scrollView: scrollView)
        } else if scrollView == mainView.mainScrollView {
            headerViewAlpha(scrollView: scrollView)
            transformBannerImage(scrollView: scrollView)
            if mainView.eventCollectionView.frame.width != 0, eventBannerViewModel.dummyData.eventViewHide {
                eventBannerViewModel.dummyData.eventViewHide = false
                mainView.eventCollectionView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * 2, y: mainView.eventCollectionView.contentOffset.y), animated: false)
            } else {
                eventBannerViewModel.dummyData.eventViewHide = true
            }
        }
    }
    
    func transformBannerImage(scrollView: UIScrollView) {
        if scrollView.bounds.origin.y < 0 {
            //scrollView.bounds.origin.y = 0
            guard let cell =  mainView.bannerCollectionView.cellForItem(at: IndexPath(row: Int(mainView.bannerCollectionView.contentOffset.x) / Int(UIScreen.main.bounds.width), section: 0)) as? TopBannerCell else { return }
            let scale = ((UIScreen.main.bounds.width - scrollView.bounds.origin.y) / UIScreen.main.bounds.width)
            cell.bannerImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
//            cell.bannerImageView.translate
        }
    }
    
    func headerViewAlpha(scrollView: UIScrollView) {
        if scrollView.bounds.origin.y > 200, scrollView.bounds.origin.y <= 300 {
            let alpha = (scrollView.bounds.origin.y - 200) / 100
            mainView.headerView.backgroundColor = UIColor(white: 1, alpha: alpha)
            mainView.logoButton.alpha = alpha
        } else if scrollView.bounds.origin.y <= 200 {
            mainView.headerView.backgroundColor = UIColor(white: 1, alpha: 0)
            mainView.logoButton.alpha = 0
        } else if scrollView.bounds.origin.y > 300 {
            mainView.headerView.backgroundColor = UIColor(white: 1, alpha: 1)
            mainView.logoButton.alpha = 1
        }
        if scrollView.bounds.origin.y > 270 {
            mainView.alarmButton.setImage(UIImage(named: "btn_alarm_b"), for: .normal)
            mainView.messageButton.setImage(UIImage(named: "btn_message_b"), for: .normal)
            mainView.rankingButton.setImage(UIImage(named: "btn_ranking_b"), for: .normal)
            mainView.storeButton.setImage(UIImage(named: "btn_store_b"), for: .normal)
        } else {
            mainView.alarmButton.setImage(UIImage(named: "btn_alarm_w"), for: .normal)
            mainView.messageButton.setImage(UIImage(named: "btn_message_w"), for: .normal)
            mainView.rankingButton.setImage(UIImage(named: "btn_ranking_w"), for: .normal)
            mainView.storeButton.setImage(UIImage(named: "btn_store_w"), for: .normal)
        }
    }
    
    func loopScroll<T: ScrollViewData>(scrollData: T, viewModel: ScrollViewModel, scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }
        if scrollData.page != Int(scrollView.contentOffset.x) / Int(UIScreen.main.bounds.width) {
            scrollData.page = Int(scrollView.contentOffset.x) / Int(UIScreen.main.bounds.width)
        }
        if scrollData.page == viewModel.getScrollDataCount() - 2, scrollData.changed == false {
            scrollData.scrollDirection = .right
            scrollData.changed = true
            viewModel.appendData()
            collectionView.reloadData()
        } else if scrollData.page == 0, scrollData.changed == false {
            scrollData.scrollDirection = .left
            scrollData.changed = true
            viewModel.insertData()
            collectionView.reloadData()
            collectionView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * 2, y: scrollView.contentOffset.y), animated: false)
        }
    }
    
    func eventBannerTextSet(scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView,
              let cell = collectionView.cellForItem(at: IndexPath(row: Int(scrollView.contentOffset.x) / Int(UIScreen.main.bounds.width), section: 0)) as? EventCell else { return }
        mainView.eventBannerPageLabel.text = "\(cell.index) / \(eventBannerViewModel.dummyData.eventBannerScrollData.firstLength - 4)"
    }

    // 스크롤 시작할때 호출
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        bannerTimer?.invalidate()
        bannerTimer = nil
    }

    // 스크롤 마치고 손 떼면 바로 호출
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        startAdsBannerLoop()
    }

    // 다음페이지 이동
    private func moveNextBanner<T: ScrollViewData>(scrollData: T, viewModel: ScrollViewModel, collectionView: UICollectionView) {
        viewModel.nextEditData()
        collectionView.reloadData()
        if scrollData.page == scrollData.firstLength - 2 {
            collectionView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * CGFloat(scrollData.firstLength - 3), y: collectionView.contentOffset.y), animated: false)
        }
        collectionView.scrollToItem(at: IndexPath(row: scrollData.page + 1, section: 0), at: .right, animated: true)

    }

    func startAdsBannerLoop(){
        bannerTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            self.moveNextBanner(scrollData: self.topBannerViewModel.dummyData.topBannerScrollData, viewModel: self.topBannerViewModel, collectionView: self.mainView.bannerCollectionView)
            self.moveNextBanner(scrollData: self.eventBannerViewModel.dummyData.eventBannerScrollData, viewModel: self.eventBannerViewModel, collectionView: self.mainView.eventCollectionView)
        }
    }
}
