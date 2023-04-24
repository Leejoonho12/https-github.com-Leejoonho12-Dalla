import Foundation
import UIKit
import SwiftyJSON

class MainViewController: UIViewController {
    
    var mainView = LiveSceneView()
    
    var scrollDirection: ScrollDirection = .none
    
    var bannerTimer: Timer? = Timer()
    
    let topBannerViewModel = TopBannerViewModel()
    
    let eventBannerViewModel = EventBannerViewModel()
    
    let topTenViewMedel = TopTenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //barItemSet()
        
        addSnpView()
        
        getBannerList()
        
        targetAdd()
        
    }
    
    private func targetAdd() {
        mainView.bjButton.addTarget(self, action: #selector(bjTapped), for: .touchDown)
        mainView.fanButton.addTarget(self, action: #selector(fanTapped), for: .touchDown)
        mainView.teamButton.addTarget(self, action: #selector(teamTapped), for: .touchDown)
    }
    
    private func addSnpView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
        mainView.mainScrollView.delegate = self
        
        mainView.bannerCollectionView.dataSource = self
        mainView.bannerCollectionView.delegate = self
        
        mainView.myBJListCollentionView.dataSource = self
        
        mainView.eventCollectionView.dataSource = self
        mainView.eventCollectionView.delegate = self
        
    }
    
    private func scrollViewStartPointSet() {
        mainView.bannerCollectionView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width * 2, y: mainView.bannerCollectionView.contentOffset.y), animated: false)
    }
    
    func getBannerList() {
        ApiService.shared.getResponseValue(requestType: .requestDallaBannerApi) { result in
            switch result {
            case .success(let model):
                self.topBannerViewModel.dataSetting(model: model)
                self.mainView.subviewAdd()
                self.mainView.constraintsAdd()
                self.setTopTen(data: self.topTenViewMedel.dummyData.bjTopTen)
                self.scrollViewStartPointSet()
                self.startAdsBannerLoop()
            case .failure(let failure):
                print("통신이 끝나고 넘어온 에러입니다: \(failure)")
            }
        }
    }
    
    @objc
    func bjTapped(_ sender: UIButton) {
        mainView.bjButton.setTitleColor(UIColor(named: "topTenChoice"), for: .normal)
        mainView.fanButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.teamButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.tipViewConstraints?.update(offset: 25)
        mainView.eventViewConstraints?.update(inset: -32)
        mainView.tipView.isHidden = false
        setTopTen(data: topTenViewMedel.dummyData.bjTopTen)
    }
    
    @objc
    func fanTapped(_ sender: UIButton) {
        mainView.bjButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.fanButton.setTitleColor(UIColor(named: "topTenChoice"), for: .normal)
        mainView.teamButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.tipView.isHidden = true
        mainView.tipViewConstraints?.update(offset: 0)
        mainView.eventViewConstraints?.update(inset: 0)
        setTopTen(data: topTenViewMedel.dummyData.fanTopTen)
    }
    
    @objc
    func teamTapped(_ sender: UIButton) {
        mainView.bjButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.fanButton.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        mainView.teamButton.setTitleColor(UIColor(named: "topTenChoice"), for: .normal)
        mainView.tipViewConstraints?.update(offset: 25)
        mainView.eventViewConstraints?.update(inset: -32)
        mainView.tipView.isHidden = false
        setTopTen(data: topTenViewMedel.dummyData.teamTopTen)
    }
    
    func setTopTen(data: [TopTenContent]) {
        _ = mainView.topTenStackView.subviews.map { $0.removeFromSuperview() }
        for content in data {
            let view = RankingContentView().then {
                $0.liveBannerImage.image = content.image
                $0.nickLabel.text = content.nick
                $0.rankImage.image = topTenViewMedel.dummyData.rankingImage[content.ranking]
                switch content.liveType {
                case .video:
                    $0.typeImage.image = UIImage(named: "btn_mini_live")
                case .radio:
                    $0.typeImage.image = UIImage(named: "btn_mini_listen")
                }
            }
            mainView.topTenStackView.addArrangedSubview(view)
            view.snp.makeConstraints {
                $0.width.equalTo(116)
                $0.height.equalTo(183)
            }
        }
    }
}
