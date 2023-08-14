import Foundation

class OrderDetailPresenter: OrderDetailPresenterProtocol {

    weak var view: OrderDetailViewProtocol?
    var router: OrderDetailRouterProtocol?
    var interactor: OrderDetailInteractorInputProtocol?
    var outputListPresenter: OrderDetailPresenterOutputProtocol?

    
    func viewDidLoad() {
        if let orderItem = interactor?.orderItem {
            view?.showOrder(orderItem)
        }
    }
    
    
    func editOrder(name: String?, price: Int?, deadline: Date?, customer: String?, made: Bool?, comment: String?, link: String?) {
        
        interactor?.editOrder(name: name, price: price, deadline: deadline, customer: customer ?? "", made: made, comment: comment, link: link)
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
        outputListPresenter?.didEditOrder(order)
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
}
