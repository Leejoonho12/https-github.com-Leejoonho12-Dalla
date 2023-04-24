import Foundation
import UIKit
import SnapKit
import Then
import Kingfisher

class TopBannerCell: UICollectionViewCell {

    static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }
    
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    var bannerImageView: UIImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.bounds.origin = CGPoint(x: 50, y: 50)
    }
    
    var bannerInfoView: UIView = UIView()
    
    var bannerMoveView: UIView = UIView()
    
    var bannerInfoStackView: UIStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 9
    }
    var bannerStarView: UIImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.image = UIImage(named: "bdg_star")
    }
    var bannerTitleLable: UILabel = UILabel().then {
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .black
        $0.font = UIFont(name: "SUIT-SemiBold", size: 24)
    }
    var bannerUserLabel: UILabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "SUIT-Regular", size: 14)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()

        makeConst()
    }
    
    override func draw(_ rect: CGRect) {
        gradientSet()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func gradientSet() {
        let colors: [CGColor] = [CGColor(red: 1, green: 1, blue: 1, alpha: 0),
                                 CGColor(red: 1, green: 1, blue: 1, alpha: 0.8),
                                 CGColor(red: 1, green: 1, blue: 1, alpha: 1)]
        gradientLayer.colors = colors
        gradientLayer.frame = bannerInfoView.bounds
        bannerInfoView.layer.addSublayer(gradientLayer)
    }

    private func addSubviews() {
        addSubview(bannerImageView)
        [bannerImageView,
         bannerInfoView,
        bannerMoveView].forEach(addSubview)
        
        bannerMoveView.addSubview(bannerInfoStackView)
        
        [bannerStarView,
        bannerTitleLable,
        bannerUserLabel].forEach(bannerInfoStackView.addArrangedSubview)
    }

    private func makeConst() {
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bannerInfoView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        bannerMoveView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()//.inset(50)
            $0.trailing.equalToSuperview()//.inset(-50)
            $0.height.equalTo(156)
        }
        bannerInfoStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(-122)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        bannerStarView.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(45)
        }
    }
    
    func configure(banner: String, title: String, user: String) {
        bannerImageView.kf.setImage(with: URL(string: banner))
        bannerTitleLable.text = title
        bannerUserLabel.text = user
    }

}
