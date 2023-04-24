import Foundation
import Then
import SnapKit
import UIKit

class RankingContentView: UIView {
    
    var liveBannerImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "태연")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }
    
    var nickLabel: UILabel = UILabel().then {
        $0.text = "달대리찡"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
    }
    
    var typeImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "btn_mini_live")
    }
    
    var rankImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "number_W-1")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        subviewAdd()
        constraintsAdd()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviewAdd() {
        [liveBannerImage,
        nickLabel].forEach(addSubview)
        
        [typeImage,
        rankImage].forEach(liveBannerImage.addSubview)
    }
    
    func constraintsAdd() {
        liveBannerImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(154)
        }
        
        nickLabel.snp.makeConstraints {
            $0.top.equalTo(liveBannerImage.snp.bottom).inset(-7)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        typeImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        rankImage.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(49)
            $0.height.equalTo(48)
        }
    }
    
}
