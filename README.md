# TshirtMerch

TshirtMerch contract offers basic functionality for managing and tracking merchandise sales. This contract provides a starting point for managing T-shirt sales on the blockchain.

### Contract State

- `owner`: Stores the address of the contract owner.
- `merchandize`: An array of Merchandize structs containing color (string) and amount (uint) for each item sold.
- `totalSupply`: The total number of available T-shirts (set to 40).
- `totalSold`: The total number of T-shirts sold.
- `onlyOwner` modifier: Ensures only the owner can call specific functions.

### Error Handling

- `noZeroAmount`: Reverts the transaction if the buyer requests 0 T-shirts.
- `emptyColor`: Reverts the transaction if the buyer tries to buy a T-shirt with an empty color string.

### Functions

- `buyMerch`: Allows the owner to register a T-shirt sale by specifying the color and amount. It checks for valid color and - - non-zero amount before adding the sale information to the merchandize array and updating totalSold.
- `MerchSold`: Returns the entire merchandize array, providing a list of all sold T-shirts with their colors and amounts.
