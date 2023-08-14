import Foundation

class OrderDetailInteractor: OrderDetailInteractorInputProtocol {
    
    weak var presenter: OrderDetailInteractorOutputProtocol?
    var orderStore = OrderAPI.shared
    var orderItem: OrderItem?
    
    func deleteOrder() {
        guard let orderItem = orderItem else { return }
        orderStore.removeOrder(orderItem)
        presenter?.didDeleteOrder()
    }
    
    func editOrder(name: String?, price: Int?, deadline: Date?, customer: String, made: Bool?, comment: String?, link: String?) {
        guard let orderItem = orderItem else { return }
        orderItem.made = true
//        orderItem.name = name ?? ""
//        orderItem.customer = customer ?? ""
        //orderItem.content = content
        presenter?.didEditOrder(orderItem)
    }
    
}
