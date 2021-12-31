# P2p API v2 payment method
### api/v2/trade/public/trade_methods/

#### GET

##### Description

SHOW ALl TRADE METHODS

##### Parameters

```ruby
{
  name: "MoMo",
  page: 1,
  limit: 15
}
```

##### Responses

success:

```ruby
{
  "data":[
    {
      "id":32,
      "name":"JETCOPay",
      "icon":null,
      "type_code":"web-wallet"
    }, 
    { 
      "id":33, 
      "name":"QIWI", 
      "icon":null, 
      "type_code":"web-wallet" 
    }
  ],
  total: 401
}
```
#----------------------------------------------------------------------------

### api/v2/trade/p2p/payment_method/:id

#### GET

##### Description

SHOW A PAYMENT METHOD

##### Parameters

```ruby

```

##### Responses

success:

```ruby
  {
    "id": 20,
    "payment_type": "other",
    "account_number": "12345",
    "bank_name": "VIB",
    "account_name": "Hoang Thai",
    "member_id": 3
  }
```
#----------------------------------------------------------------------------

### api/v2/trade/p2p/payment_methods

#### GET

##### Description

List payment method

##### Parameters

```ruby

```

##### Responses

success:

```ruby
[
  {
    "id": 20,
    "payment_type": "other",
    "account_number": "12345",
    "bank_name": "VIB",
    "account_name": "Hoang Thai",
    "member_id": 3
  },
  {
    "id": 21,
    "payment_type": "other",
    "account_number": "12345",
    "bank_name": "MB",
    "account_name": "Hoang Thai",
    "member_id": 3
  }
]
```


#----------------------------------------------------------------------------

# P2p API v2 payment method

### api/v2/trade/p2p/payment_method

#### POST

##### Description

Create payment method 

##### Parameters

```ruby
{
  "account_number": "12345",
  "account_name": "Hoang Thai",
  "bank_name": "VIB",
  "payment_type": "other",
  "phone": "+84988343334",
  "email": "hant@2nf.vn"
}
```

##### Responses

success:

```ruby
{
    "id": 20,
    "payment_type": "other",
    "account_number": "12345",
    "bank_name": "VIB",
    "account_name": "Hoang Thai",
    "member_id": 3,
    "phone": "+84988343334",
    "email": "hant@2nf.vn"
}
```

#----------------------------------------------------------------------------
### api/v2/trade/p2p/payment_method/:id

#### PUT

##### Description

Edit payment method

##### Parameters

```ruby
{
  "account_number": "Edit payment method",
  "account_name": "ThaidangHoang",
  "bank_name": "ACB",
  "payment_type": "bank_transfer"
}
```

##### Responses

success:

```ruby
{
  "id": 20,
  "payment_type": "bank_transfer",
  "account_number": "Edit payment method",
  "bank_name": "ACB",
  "account_name": "ThaidangHoang",
  "member_id": 3
}
```
#------------------------------------------------------------
#----------------------------------------------------------------------------
### api/v2/trade/p2p/payment_method/:id

#### DELETE

##### Description

DELETE payment method

##### Parameters

```ruby

```

##### Responses

success:

```ruby
"delete success!"
```
