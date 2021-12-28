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
  "payment_type": "other"
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
    "member_id": 3
}
```

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
