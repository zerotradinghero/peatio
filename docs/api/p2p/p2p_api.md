# P2p API v2

### api/v2/trade/p2p/advertises
#### GET

##### Description

Show all advertis with type(sell/buy)

##### Parameters

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 |  [{"price":"100000.0","advertis_type":"sell","avaiable_coin":"10000.0","upper_limit":"12345677.0","lower_limit":"123.0","description":"test"}]| ---

### api/v2/trade/p2p/p2p_order/:id
#### POST

##### Description

Update status of P2pOrder(ordered/paid/complete/cancel)

##### Parameters

```ruby
{
  "status": "paid",
  "payment_method_id": 1
}
```
##### Responses

success: 
```ruby
{
  "id": 13,
  "status": "paid",
  "p2p_orders_type": "sell",
  "price": "1000000000000000.0",
  "ammount": "123123000000000000000.0",
  "number_of_coin": "123123.0",
  "order_number": "ec2ab88d5ff3",
  "payment_method": {
    "payment_type": "bank_transfer",
    "account_number": "123456789",
    "bank_name": "thai",
    "account_name": "hoangthai"
  },
  "advertisement": {
    "id": 12,
    "price": "1000000000000000.0",
    "advertis_type": "sell",
    "avaiable_coin": "1.0",
    "upper_limit": "50000.0",
    "lower_limit": "30000.0",
    "description": "mua tien ao",
    "currency": {
      "id": "btc",
      "name": "Bitcoin",
      "description": null,
      "homepage": null,
      "price": "1.0",
      "type": "coin",
      "precision": 8,
      "position": 3
    },
    "creator": {
      "username": null
    },
    "payment_methods": [
      {
        "payment_type": "bank_transfer",
        "account_number": "123456789",
        "bank_name": "thai",
        "account_name": "hoangthai"
      },
      {
        "payment_type": "",
        "account_number": "123456",
        "bank_name": "vietcombank",
        "account_name": "thaidang"
      }
    ]
  }
}
```

errors:
```ruby
update fail!
```

### api/v2/trade/p2p/p2p_orders
#### POST

##### Description

Create P2pOrder

##### Parameters

```ruby
{
    "p2p_orders_type": "sell",
    "advertisement_id": "1",
    "number_of_coin": "123123"
}
```

##### Responses
success:

```ruby

{
    "id": 5,
    "p2p_orders_type": "sell",
    "price": "10000.0",
    "ammount": "1231230000.0",
    "number_of_coin": "123123.0",
    "order_number": "69695b6037b1",
    "advertisement": {
        "id": 1,
        "price": "10000.0",
        "advertis_type": "buy",
        "avaiable_coin": "1111.0",
        "upper_limit": "1000000.0",
        "lower_limit": "1000.0",
        "description": "test",
        "currency": {
            "id": "btc",
            "name": "Bitcoin",
            "description": null,
            "homepage": null,
            "price": "1.0",
            "type": "coin",
            "precision": 8,
            "position": 3
        },
        "creator": {
            "username": null
        },
        "payment_methods": []
    }
}

```

errors:
```ruby
    [
        "p2p.p2porder.missing_number_of_coin",
        "p2p.p2p_order.non_positive_number_of_coin"
    ]
```
