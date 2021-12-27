# P2p API v2 Claim

### api/v2/trade/p2p/p2p_order/:id/claim

#### POST

##### Description

Create claim for p2porder

##### Parameters
```ruby
{
    "reason": "test claim",
    "description": "claim description",
    "claim_images": ["1,2"]
}
```

##### Responses

```ruby
"Create claim order success!"
```

### /api/v2/trade/p2p/claim/:id

#### POST

##### Description

Edit claim for p2porder

##### Parameters

```ruby
{
  "reason": "Test",
  "description": "is test",
  "images": ["image, image1, image2"]

}
```

##### Responses

```ruby
{
  "id": 15,
  "creator_adv_id": 3,
  "p2p_order_id": 251,
  "reason": "Test",
  "description": "is test",
  "order_number": "42fc9da3bb71",
  "attachments": [
    {
      "image": "image, image1, image2"
    }
  ],
  "created_at": "2021-12-26T09:39:47.440Z"
}
```

### api/v2/trade/p2p/claims

#### GET

##### Description

List claim for p2porder

##### Parameters

```ruby

```

##### Responses

```ruby
[
  {
    "id": 17,
    "creator_adv_id": 2,
    "p2p_order_id": 245,
    "reason": "test claim",
    "description": "claim description",
    "order_number": "80f17306847c",
    "attachments": [
      {
        "image": "1,2"
      }
    ],
    "created_at": "2021-12-26T09:48:16.759Z"
  },
  {
    "id": 16,
    "creator_adv_id": 3,
    "p2p_order_id": 251,
    "reason": "test claim",
    "description": "claim description",
    "order_number": "42fc9da3bb71",
    "attachments": [
      {
        "image": "1,2"
      }
    ],
    "created_at": "2021-12-26T09:42:00.083Z"
  },
  {
    "id": 14,
    "creator_adv_id": 3,
    "p2p_order_id": 251,
    "reason": "test claim",
    "description": "claim description",
    "order_number": "42fc9da3bb71",
    "attachments": [
      {
        "image": "1,2"
      }
    ],
    "created_at": "2021-12-26T09:32:59.498Z"
  }
]
```

### api/v2/trade/p2p/claim/:id

#### GET

##### Description

Show claim for p2porder

##### Parameters

```ruby

```

##### Responses

```ruby
{
    "id": 15,
    "creator_adv_id": 3,
    "p2p_order_id": 251,
    "reason": "Test",
    "description": "is test",
    "order_number": "42fc9da3bb71",
    "attachments": [
        {
            "image": "image, image1, image2"
        }
    ],
    "created_at": "2021-12-26T09:39:47.440Z"
}
```
