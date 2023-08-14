import Foundation

struct SectionOrdersItem {
    var orders: [OrderItem] = []
    var date: Date
}

class OrderItem {
    var name: String = ""
    var price: Double?
    var deadline: String?
    var customer: String?
    var made: Bool?
    var comment: String?
    var link: String?
    
    init(name: String = "",
        price: Double?,
        deadline: String?,
        customer: String?,
        made: Bool?,
        comment: String?,
        link: String?) {
        
        self.name = name
        self.price = price
        self.deadline = deadline
        self.customer = customer
        self.made = made
        self.comment = comment
        self.link = link
    }
}
