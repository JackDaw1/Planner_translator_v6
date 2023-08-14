import Foundation

class OrderDetailPresenter: OrderDetailPresenterProtocol {

    weak var view: OrderDetailViewProtocol?
    var router: OrderDetailRouterProtocol?
    var interactor: OrderDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let orderItem = interactor?.orderItem {
            view?.showOrder(orderItem)
        }
    }
    
//    var name: String
//    var price: Int?
//    var deadline: Date?
//    var customer: String?
//    var paid: Bool?
//    var comment: String?
    
    func editOrder(name: String, price: Int?, deadline: Date?, customer: String, made: Bool?, comment: String?, link: String?) {
        
        interactor?.editOrder(name: name, price: price, deadline: deadline, customer: customer, made: made, comment: comment, link: link)
    }
    
    func deleteOrder() {
        interactor?.deleteOrder()
    }
    
}

extension OrderDetailPresenter: OrderDetailInteractorOutputProtocol {
    
    func didDeleteOrder() {
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
    
    func didEditOrder(_ order: OrderItem) {
        view?.showOrder(order)
    }
    
}
