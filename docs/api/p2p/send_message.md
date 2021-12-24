### Send message
```ruby

cd z-dax
nano templates/config/barong/management_api.yml.erb

### change the whole =>
  
keychain:
applogic:
algorithm: RS256
value: <%= @jwt_public_key %>
peatio:
algorithm: RS256
value: <%= @jwt_public_key %>

scopes:
read_users:
mandatory_signers:
- applogic
permitted_signers:
- applogic
otp_sign:
mandatory_signers:
- applogic
permitted_signers:
- applogic
send_phones:
mandatory_signers:
- peatio
permitted_signers:
- peatio


nano templates/config/peatio.env.erb
### add at the end :

SECRET_KEY_BASE=faiba2shei0Ae5gahCh4aipoh3meyaFi
FORCE_SECURE_CONNECTION="false"
JWT_PRIVATE_KEY=<%= @jwt_private_key %

```
```ruby
docker-compose rm -fs barong
docker pull zsmartex/barong
rake service:app service:daemons
```
