import UIKit

class OrderDetailViewController: UIViewController {
    
    var titleLabel: UILabel = UILabel()
    var customerLabel: UILabel = UILabel()
    var priceLabel: UILabel = UILabel()
    
    var presenter: OrderDetailPresenterProtocol?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        [
            titleLabel,
            priceLabel,
            customerLabel,
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            customerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            customerLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            customerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            customerLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: customerLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: customerLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: customerLabel.bottomAnchor),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        presenter?.viewDidLoad()
    }
    
}

extension OrderDetailViewController: OrderDetailViewProtocol {
    
    func showOrder(_ order: OrderItem) {
        
        titleLabel.text = order.name
        customerLabel.text = order.customer
        //priceLabel.text = order.price

    }
    
}

