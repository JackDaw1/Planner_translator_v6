import UIKit

protocol CustomerDetailViewProtocol: AnyObject {
    
    var presenter: CustomerDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCustomer(_ customer: CustomerItem)
}

protocol CustomerDetailPresenterProtocol: AnyObject {
    
    var view: CustomerDetailViewProtocol? { get set }
    var interactor: CustomerDetailInteractorInputProtocol? { get set }
    var router: CustomerDetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?)
    func deleteCustomer()
}

protocol CustomerDetailInteractorInputProtocol: AnyObject {
    
    var presenter: CustomerDetailInteractorOutputProtocol? { get set }
    var customerItem: CustomerItem? { get set }
    
    // PRESENTER -> INTERACTOR
    func deleteCustomer()
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?)
}

protocol CustomerDetailInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didDeleteCustomer()
    func didEditCustomer(_ customer: CustomerItem)
}

protocol CustomerDetailRouterProtocol: AnyObject {
    
    static func createCustomerDetailRouterModule(with customer: CustomerItem) -> UIViewController
    
    // PRESENTER -> ROUTER
    func navigateBackToListViewController(from view: CustomerDetailViewProtocol)
    
}
