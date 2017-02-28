# Awesome Payment
Awesome Payment implements a simple checkout for a marketplace.

## Installation


### Install from Git

Add the following in the Gemfile:

    gem 'awesome_payment', :git => 'https://github.com/iCEAGE/awesome_payment.git'


## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'awesome_payment'

include AwesomePayment

product_1 = Product.new("001", 'Lavender heart', 9.25)
product_2 = Product.new("002", 'Personalised cufflinks', 45.00)
product_3 = Product.new("003", 'Kids T-shirt', 19.95)

# 2 or more Lavender hearts then the price drops to £8.50
product_promotion = ProductPromotion.new(product_1.product_code, 8.50, 2)

# spend over £60, then you get 10% off
basket_promotion = BasketPromotion.new(60, 10)

promotional_rules = PromotionalRules.new
promotional_rules << product_promotion
promotional_rules << basket_promotion

co = Checkout.new(promotional_rules)
co.scan(product_1)
co.scan(product_2)
co.scan(product_1)
co.scan(product_3)
price = co.total

# £73.76 
puts price
```

## Tests
To run the tests:
````
bundle exec rake
````

## License

Copyright (C) 2017  Hamed Ramezanian Nik

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
