import Foundation
import Then
import SnapKit
import UIKit

class LiveSceneView: UIView {
    
    var tipViewConstraints: Constraint?
    
    var eventViewConstraints: Constraint?
    
    var mainScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    var headerView: UIView = UIView().then {
        $0.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    var alarmButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_alarm_w"), for: .normal)
    }
    
    var messageButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_message_w"), for: .normal)
    }
    
    var rankingButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_ranking_w"), for: .normal)
    }
    
    var storeButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_store_w"), for: .normal)
    }
    
    var logoButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "dalla_logo"), for: .normal)
        $0.alpha = 0
    }
    
    var alarmPointImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "ico_alarm_point")
    }
    
    var bannerCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false

        return view
    }()
    
    var myBJListCollentionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.itemSize = CGSize(width: 90, height: 127)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .white
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    // ========== TOP10Views ===========
    var topTenView: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var topTenLabel: UILabel = UILabel().then {
        $0.text = "🏆 NOW TOP 10"
        $0.font = UIFont(name: "SUIT-SemiBold", size: 18)
        $0.textColor = .black
    }
    
    var vIconImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "v icon")
    }
    
    var teamButton: UIButton = UIButton().then {
        $0.setTitle("TEAM", for: .normal)
        $0.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        $0.titleLabel!.font = UIFont(name: "SUIT-Bold", size: 14)
    }
    
    var rightLineView: UIView = UIView().then {
        $0.backgroundColor = UIColor(named: "guardLine")
    }
    
    var fanButton: UIButton = UIButton().then {
        $0.setTitle("FAN", for: .normal)
        $0.setTitleColor(UIColor(named: "topTenNoneChoice"), for: .normal)
        $0.titleLabel!.font = UIFont(name: "SUIT-Bold", size: 14)
    }
    
    var leftLineView: UIView = UIView().then {
        $0.backgroundColor = UIColor(named: "guardLine")
    }
    
    var bjButton: UIButton = UIButton().then {
        $0.setTitle("BJ", for: .normal)
        $0.setTitleColor(UIColor(named: "topTenChoice"), for: .normal)
        $0.titleLabel!.font = UIFont(name: "SUIT-Bold", size: 14)
    }
    
    var topTenScrollView: UIScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    var topTenStackView: UIStackView = UIStackView().then {
        $0.spacing = 8
    }
    
    var tipStackView: UIStackView = UIStackView().then {
        $0.axis = .vertical
    }
    
    var tipView: UIView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12.5
        $0.backgroundColor = UIColor(named: "tipColor")
    }
    
    var tipImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "img_tip")
        $0.contentMode = .scaleToFill
    }
    
    var tipVIcon: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "v icon")
        $0.contentMode = .scaleToFill
    }
    
    var tipLabel: UILabel = UILabel().then {
        $0.text = "타임랭킹 1~3위시, 스타DJ 가산점 지급"
        $0.font = UIFont(name: "SUIT-Medium", size: 13)
        $0.textColor = .black
    }
    // ===========topTenViewEnd===========
    
    var eventCollectionView: UICollectionView  = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
//        flowLayout.
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false

        return view
    }()
    
    var eventBannerPageView: UIView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(named: "page")
    }
    
    var eventBannerPageArrow: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "banner_arrow")
    }
    
    var eventBannerPageLabel: UILabel = UILabel().then {
        $0.text = "1 / 2"
        $0.font = UIFont(name: "SUIT-Medium", size: 13)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        subviewAdd()
//        constraintsAdd()
        
        registerCell()
        
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviewAdd() {
        [mainScrollView,
        headerView].forEach(addSubview)
        
        [alarmButton,
        messageButton,
        rankingButton,
        storeButton,
        logoButton].forEach(headerView.addSubview)
        
        alarmButton.addSubview(alarmPointImage)
        
        [bannerCollectionView,
        myBJListCollentionView,
        topTenView,
        topTenScrollView,
        tipStackView,
        eventCollectionView,
        eventBannerPageView].forEach(mainScrollView.addSubview)
        
        [topTenLabel,
        vIconImage,
        teamButton,
        rightLineView,
        fanButton,
        leftLineView,
        bjButton].forEach(topTenView.addSubview)
        
        topTenScrollView.addSubview(topTenStackView)
        
        tipStackView.addArrangedSubview(tipView)
        
        [tipImage,
        tipVIcon,
        tipLabel].forEach(tipView.addSubview)
        
        [eventBannerPageArrow,
         eventBannerPageLabel].forEach(eventBannerPageView.addSubview)
        
    }
    
    func constraintsAdd() {
        mainScrollView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(-20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.height.equalTo(72)
        }
        
        alarmButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.top.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().inset(6)
            $0.width.equalTo(40)
        }
        
        messageButton.snp.makeConstraints {
            $0.trailing.equalTo(alarmButton.snp.leading).inset(8)
            $0.top.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().inset(6)
            $0.width.equalTo(40)
        }
        
        rankingButton.snp.makeConstraints {
            $0.trailing.equalTo(messageButton.snp.leading).inset(8)
            $0.top.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().inset(6)
            $0.width.equalTo(40)
        }
        
        storeButton.snp.makeConstraints {
            $0.trailing.equalTo(rankingButton.snp.leading).inset(8)
            $0.top.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().inset(6)
            $0.width.equalTo(40)
        }
        
        logoButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(13)
            $0.width.equalTo(71)
        }
        
        alarmPointImage.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(3)
            $0.width.height.equalTo(10)
        }
        
        bannerCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(safeAreaLayoutGuide.snp.width)
            $0.width.equalToSuperview()
        }
        
        myBJListCollentionView.snp.makeConstraints {
            $0.top.equalTo(bannerCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(127)
        }
        
        topTenView.snp.makeConstraints {
            $0.top.equalTo(myBJListCollentionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        topTenLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(141)
        }
        
        vIconImage.snp.makeConstraints {
            $0.leading.equalTo(topTenLabel.snp.trailing)
            $0.top.bottom.equalToSuperview().inset(14)
            $0.width.equalTo(24)
        }
        
        teamButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(43)
        }
        
        rightLineView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.trailing.equalTo(teamButton.snp.leading).inset(-10)
            $0.width.equalTo(1)
        }
        
        fanButton.snp.makeConstraints {
            $0.trailing.equalTo(rightLineView.snp.leading).inset(-10)
            $0.top.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(30)
        }
        
        leftLineView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.trailing.equalTo(fanButton.snp.leading).inset(-10)
            $0.width.equalTo(1)
        }
        
        bjButton.snp.makeConstraints {
            $0.trailing.equalTo(leftLineView.snp.leading).inset(-10)
            $0.top.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(19)
        }
        
        topTenScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topTenView.snp.bottom)
            $0.height.equalTo(183)
        }
        
        topTenStackView.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        tipStackView.snp.makeConstraints {
            $0.top.equalTo(topTenScrollView.snp.bottom).inset(-10)
            $0.leading.trailing.equalToSuperview().inset(16)
            //$0.height.equalTo(25)
            tipViewConstraints = $0.height.equalTo(25).constraint
        }
        
        tipView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            //$0.height.equalTo(25)
        }
        
        tipImage.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        tipVIcon.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(2.5)
            $0.height.width.equalTo(20)
        }
        
        tipLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(tipImage.snp.trailing).inset(-11)
            $0.trailing.equalTo(tipVIcon.snp.leading)
        }
        
        eventCollectionView.snp.makeConstraints {
            eventViewConstraints = $0.top.equalTo(tipStackView.snp.bottom).inset(-32).constraint
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(115)
            $0.bottom.equalToSuperview() //
        }
        
        eventBannerPageView.snp.makeConstraints {
            $0.trailing.equalTo(eventCollectionView).inset(-10)
            $0.bottom.equalTo(eventCollectionView).inset(15)
            $0.width.equalTo(65)
            $0.height.equalTo(20)
        }
        
        eventBannerPageArrow.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.height.equalTo(16)
        }
        
        eventBannerPageLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(2)
            $0.trailing.equalTo(eventBannerPageArrow.snp.leading).inset(-4)
            $0.width.equalTo(26)
        }
    }
    
    func registerCell() {
        bannerCollectionView.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.id)
        myBJListCollentionView.register(MyBJCell.self, forCellWithReuseIdentifier: MyBJCell.id)
        eventCollectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.id)
    }
    
}
