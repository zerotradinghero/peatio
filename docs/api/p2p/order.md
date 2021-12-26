### /api/v2/trade/p2p/member/p2p_orders

#### GET

##### Description

Member list P2pOrder

##### Parameters

```ruby
{
  status: "1,2,3", # 0: ordered, 1: transfer, 2: paid, 3: complete, 4:cancel, nil: all
  p2p_orders_type: 0, # 0:sell, 1:buy, nil: all
  order_number: "4a3318e6f7c7" # no data: nil 
}
```

##### Responses

success:

```ruby

[
  {
    "id": 51,
    "member_id": 2,
    "status": "ordered",
    "p2p_orders_type": "sell",
    "price": "1000000000000000.0",
    "ammount": "10000000000000.0",
    "advertis_payment_method_id": null,
    "order_number": "3ec5dabfb279",
    "advertisement_id": 40,
    "number_of_coin": "0.01",
    "payment_method_id": null,
    "created_at": "2021-12-06T12:17:19.983Z"
  },
  {
    "id": 52,
    "member_id": 2,
    "status": "ordered",
    "p2p_orders_type": "sell",
    "price": "1000000000000000.0",
    "ammount": "10000000000000.0",
    "advertis_payment_method_id": null,
    "order_number": "02872e0d6a23",
    "advertisement_id": 40,
    "number_of_coin": "0.01",
    "payment_method_id": null,
    "created_at": "2021-12-06T12:17:47.768Z"
  },
  {
    "id": 53,
    "member_id": 2,
    "status": "ordered",
    "p2p_orders_type": "sell",
    "price": "1000000000000000.0",
    "ammount": "10000000000000.0",
    "advertis_payment_method_id": null,
    "order_number": "77e7f1284987",
    "advertisement_id": 40,
    "number_of_coin": "0.01",
    "payment_method_id": null,
    "created_at": "2021-12-06T12:20:55.524Z"
  }
]

```