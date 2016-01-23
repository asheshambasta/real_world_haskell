-- file: ch03/BookStore.hs

type CustomerID = Int
type CardNumber = String
type CardHolder = String
type Address = [String]

data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)
                    
data BookReview = BookReview BookInfo CustomerID String

type BookRecord = (BookInfo, BookReview)

data BillingInfo =  CreditCard CardNumber CardHolder Address
                    | CashOnDelivery
                    | Invoice CustomerID
                    deriving (Show)

data Customer = Customer {
    customerID :: CustomerID,
    customerName :: String,
    customerAddress :: Address
    } deriving (Show)


bookAuthors (Book _ _ auths) = auths
bookID (Book id _ _) = id
bookTitle (Book _ title _) = title

customer2 = Customer {
    customerID = 12,
    customerName = "bambam",
    customerAddress = []
}

