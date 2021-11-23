# P2p API v2

### api/v2/trade/p2p/advertises
#### GET

##### Description

Show all advertis with type(sell/buy)

##### Parameters

| Name | Located in | Description | Required | Schema | Example
| ---- | ---------- | ----------- | -------- | ---- | ----
| advertis_type | url | type of advertis | Yes | string | sell/buy

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 |  [{"price":"100000.0","advertis_type":"sell","avaiable_coin":"10000.0","upper_limit":"12345677.0","lower_limit":"123.0","description":"test"}]| ---


