# README

### Prerequisites

You are going to need:

- **Linux or OSX**
- **Ruby version-2.6.0**
- **Rails version-5.2**
- **Bundler** - If Ruby is installed but the `bundle` command does not work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone the repository.
2. `cd currency_exchange_freska`

```shell
bundle install
bundle exec figaro install( Since FI am using Fiagro gem to handle ENV variables)
This creates a commented config/application.yml file and adds it to your .gitignore. Add your own api key from Fixer to this file like this `fixer_api_key: XXXXXX` and you're done!
rails s
```
### Endpoints

The project has wrapped currency rates Apis provided by `Fixer.io` to create a microservice.

+ **Latest Rates:**

  This end point returns all latest rates.

  #### HTTP Request
  `GET http://localhost:3000//exchange_rates/latest`
  
  #### Request Parameters
  
  | Parameter |Presence|
  | --------- |-------|
  | base_currency| optional 
  | target_currency | optional

+ **Historical Rates:**

  This end point returns histroical rates with respect to the given base currency and target currency.

  #### HTTP Request
  `GET http://localhost:3000//exchange_rates/historical`
  
  #### Request Parameters
  
  | Parameter | Presence|
  | --------- | --------|
  | base_currency |required 
  | target_currency |required
  | exchange_date |required
  
