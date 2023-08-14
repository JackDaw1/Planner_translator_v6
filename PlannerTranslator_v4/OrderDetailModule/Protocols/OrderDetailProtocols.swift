
import UIKit

protocol OrderDetailViewProtocol: AnyObject {
    
    var presenter: OrderDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showOrder(_ order: OrderItem)
}

protocol OrderDetailPresenterProtocol: AnyObject {
    
    var view: OrderDetailViewProtocol? { get set }
    var interactor: OrderDetailInteractorInputProtocol? { get set }
    var router: OrderDetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func editOrder(name: String?, price: Int?, deadline: Date?, customer: String?, made: Bool?, comment: String?, link: String?)
    func deleteOrder()
}

protocol OrderDetailInteractorInputProtocol: AnyObject {
    
    var presenter: OrderDetailInteractorOutputProtocol? { get set }
    var orderItem: OrderItem? { get set }
    
    // PRESENTER -> INTERACTOR
    func deleteOrder()
    func editOrder(name: String?, price: Int?, deadline: Date?, customer: String, made: Bool?, comment: String?, link: String?)
}

protocol OrderDetailInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didDeleteOrder()
    func didEditOrder(_ order: OrderItem) 
}


protocol OrderDetailPresenterOutputProtocol: AnyObject {

    // INTERACTOR -> PRESENTER
    func didDeleteOrder(_ order: OrderItem)
    func didEditOrder(_ order: OrderItem)
}

protocol OrderDetailRouterProtocol: AnyObject {
    
    static func createOrderDetailRouterModule(with order: OrderItem,
                                              outputPresenter: OrderDetailPresenterOutputProtocol) -> UIViewController
    
    // PRESENTER -> ROUTER
    func navigateBackToListViewController(from view: OrderDetailViewProtocol)
    
}
