## /api/v2/trade/p2p/my_advertises

#### GET

##### Description

GET ALL MY ADVERTIS

##### Parameters

```ruby
{
  visible: 0, # 0: disabled, 1: enabled, nil: all
  advertis_type: 0, # 0:sell, 1:buy, nil: all
  currency_id: "btc", # no data: nil, eth, usdt,...
  currency_payment_id: "vnd", # no data: nil, usd,,...
  price_type: 0, # 0:fixed, 1: floating
  start_date: "2021-12-12",
  end_date: "2021-30-12",
  page: 1,
  limit: 15
}

#all field is optional 
```

##### Responses

success:

```ruby

[
  {
    "id": 119,
    "price": "23640.0",
    "expired_time": 15,
    "advertis_type": "buy",
    "coin_avaiable": 0.7698815566835897,
    "upper_limit": "200000.0",
    "lower_limit": "100000.0",
    "description": "Today SNT test",
    "price_percent": 100,
    "currency": {
      "id": "usdt",
      "name": "Tether",
      "description": null,
      "homepage": null,
      "price": "1.0",
      "type": "coin",
      "precision": 8,
      "position": 1
    },
    "creator": {
      "id": 2,
      "email": "admin@zsmart.tech",
      "created_at": "2021-11-29T06:44:43.980Z",
      "updated_at": "2021-12-23T03:53:10.312Z",
      "uid": "ID123260D6EB",
      "level": 3,
      "role": "admin",
      "state": "active",
      "group": "vip-0",
      "username": null,
      "referral_uid": null,
      "beneficiaries_whitelisting": true
    },
    "payment_methods": [
      {
        "id": 3,
        "payment_type": "bank_transfer",
        "account_number": "1234455",
        "bank_name": "vcb",
        "account_name": "Nguyen Thi Ha"
      }
    ],
    "currency_payment_id": "vnd",
    "price_type": "fixed",
    "visible": "enabled",
    "created_at": "2021-12-23T04:03:06.692Z",
    "total_amount": "10.0"
  }
]

```
##----------------------------------------------------------------------
## /api/v2/trade/p2p/my_advertise/:id

#### GET

##### Description

SHOW A MY ADVERTIS

##### Parameters

```ruby
{}

```

##### Responses

success:

```ruby

[
  {
    "id": 119,
    "price": "23640.0",
    "expired_time": 15,
    "advertis_type": "buy",
    "coin_avaiable": 0.7698815566835897,
    "upper_limit": "200000.0",
    "lower_limit": "100000.0",
    "description": "Today SNT test",
    "price_percent": 100,
    "currency": {
      "id": "usdt",
      "name": "Tether",
      "description": null,
      "homepage": null,
      "price": "1.0",
      "type": "coin",
      "precision": 8,
      "position": 1
    },
    "creator": {
      "id": 2,
      "email": "admin@zsmart.tech",
      "created_at": "2021-11-29T06:44:43.980Z",
      "updated_at": "2021-12-23T03:53:10.312Z",
      "uid": "ID123260D6EB",
      "level": 3,
      "role": "admin",
      "state": "active",
      "group": "vip-0",
      "username": null,
      "referral_uid": null,
      "beneficiaries_whitelisting": true
    },
    "payment_methods": [
      {
        "id": 3,
        "payment_type": "bank_transfer",
        "account_number": "1234455",
        "bank_name": "vcb",
        "account_name": "Nguyen Thi Ha"
      }
    ],
    "currency_payment_id": "vnd",
    "price_type": "fixed",
    "visible": "enabled",
    "created_at": "2021-12-23T04:03:06.692Z",
    "total_amount": "10.0"
  }
]

```
errors:
```azure
"ads not found!"
```