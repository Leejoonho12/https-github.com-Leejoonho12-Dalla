import Foundation
import UIKit
import SnapKit
import Then

class EventCell: UICollectionViewCell {
    
    static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }
    
    var index = 0
    
    var eventBannerImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "02-배너")
        $0.contentMode = .scaleToFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()

        makeConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(eventBannerImage)
    }
    
    func makeConst() {
        eventBannerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
