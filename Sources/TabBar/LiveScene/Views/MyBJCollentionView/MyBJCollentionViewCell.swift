import Foundation
import UIKit
import SnapKit
import Then
import Kingfisher

class MyBJCell: UICollectionViewCell {
    
    static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }
    
    var backImage: UIImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.image = UIImage(named: "SE-4c8e90d6-2523-4655-8495-8e4e79781af4")
    }
    
    var nickLabel: UILabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "SUIT-Regular", size: 12)
        $0.text = "달대리찡"
    }
    
    var whiteView: UIView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 38
        $0.backgroundColor = .white
    }
    
    var bjImage: UIImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 35
        $0.contentMode = .scaleToFill
        $0.image = UIImage(named: "태연3")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()

        makeConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        
        [backImage,
         nickLabel].forEach(addSubview)
        
        backImage.addSubview(whiteView)

        whiteView.addSubview(bjImage)
    }
    
    private func makeConst() {
        
        backImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(80)
        }
        
        nickLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(2)
            //$0.height.width.equalTo(76)
        }

        bjImage.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(3)
            //$0.height.width.equalTo(70)
        }
    }
    
    func configure(img: String, user: String) {
        bjImage.kf.setImage(with: URL(string: img))
        nickLabel.text = user
    }
}
