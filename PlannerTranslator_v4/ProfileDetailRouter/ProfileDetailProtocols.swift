//import UIKit
//
//protocol ProfileDetailViewProtocol: AnyObject {
//    
//    var presenter: ProfileDetailPresenterProtocol? { get set }
//    
//    // PRESENTER -> VIEW
//    func showProfile(_ profile: ProfileItem)
//}
//
//protocol ProfileDetailPresenterProtocol: AnyObject {
//    
//    var view: ProfileDetailViewProtocol? { get set }
//    var interactor: ProfileDetailInteractorInputProtocol? { get set }
//    var router: ProfileDetailRouterProtocol? { get set }
//    
//    // VIEW -> PRESENTER
//    func viewDidLoad()
//    func editProfile(name: String?, contact1:String?, contact2: String?)
//}
//
//protocol ProfileDetailInteractorInputProtocol: AnyObject {
//    
//    var presenter: ProfileDetailInteractorOutputProtocol? { get set }
//    var profileItem: ProfileItem? { get set }
//    
//    // PRESENTER -> INTERACTOR
//    func editProfile(name: String?, contact1: String?, contact2: String?)
//}
//
//protocol ProfileDetailInteractorOutputProtocol: AnyObject {
//    
//    // INTERACTOR -> PRESENTER
//    func didEditProfile(_ profile: ProfileItem)
//}
//
//protocol ProfileDetailRouterProtocol: AnyObject {
//    
//    static func createProfileDetailRouterModule() -> UIViewController
//    
//    // PRESENTER -> ROUTER
//    func navigateBackToListViewController(from view: ProfileDetailViewProtocol)
//    
//}
