import Foundation


enum SearchFilterViewModel: Int, CaseIterable{
    
    case payments
    case debts
    
    var title: String{
        switch self {
        case .payments: return "Harcama"
        case .debts: return "Borç"
        
        
        }
    }
}

