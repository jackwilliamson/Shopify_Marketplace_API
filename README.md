# API Functionality


#### GET /products
Will return a list of all products. If a parameter title of type string is included, will return the product with that name.

#### GET /products/:id
Will return the product associated with the given id.

#### GET /products/:id/purchase
Will attempt to purchase the product associated with the given id, returning the product with either a success or failure
message based on whether their was enough inventory for the sale. Will decrement the inventory_count if the sale was successful.

#### GET /products/available
Will return a list of all products that are available (have at least one item in inventory).

#### POST /products
Will create a product, requires fields:
* title - string
* price - float 
* inventory_count - int