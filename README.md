# Studdy Buddy back

Backend for Studdy-Buddy landing page

### Installation
Install project dependencies
```
bundle install
```
Database Setup (PostgreSQL required)
```
createuser -U postgres studdy_buddy
createdb -U postgres studdy_buddy

rake db:up # run pending migrations
```
Start server
```
rackup RACK_ENV=production
```

### Endpoints

`POST /users`

Params:
- `name`: String
- `email`: String
- `subscribed`: Boolean