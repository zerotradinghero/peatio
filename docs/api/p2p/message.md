## message 
### api/v2/trade/p2p/order/:id/new_message

#### POST

##### Description

Create Advertisements

##### Parameters

```ruby
{
  "content": "toi muon noi chuyen",
  "images": ["image1", "image2"]
}

```

##### Responses

success:

```ruby
"create success"
```

## ---------------------------------------------------------------------
### api/v2/trade/p2p/order/:id/messages

#### GET

##### Description

List Message

##### Parameters

```ruby

```

##### Responses

success:

```ruby
[
  {
    "id":3,
    "content":"test",
    "member_id":2,
    "created_at":"2021-12-31T10:01:09.081Z",
  "attachments":[
    {
      "image": "1,2"
    }
  ]
  },
  {
    "id":4,
    "content":"test",
    "member_id":2,
    "created_at":"2021-12-31T10:01:09.081Z",
    "attachments":[
      {
        "image": "1,2"
      }
    ]
  }
]
```

## ---------------------------------------------------------------------