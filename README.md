# CronosChainScanner

Cronos Chain Scanner

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cronos_chain_scanner'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cronos_chain_scanner

## Usage

```ruby
CronosChainScanner.net = 'testnet3' or CronosChainScanner.net = 'main' (default)
```

```ruby
CronosChainScanner::Blocks.eth_block_number

CronosChainScanner::Contracts.listcontracts

CronosChainScanner::Accounts.eth_get_balance(@address)
CronosChainScanner::Accounts.balance(@address)
CronosChainScanner::Accounts.txlist(@address, starttimestamp)
CronosChainScanner::Accounts.tokenbalance(@contractaddress, @address)

CronosChainScanner::Transactions.gettxinfo(@txhash)
CronosChainScanner::Transactions.gettxreceiptstatus(@txhash)
CronosChainScanner::Transactions.getstatus(@txhash)

CronosChainScanner::Tokens.getToken(@contractaddress)

CronosChainScanner::Contracts.listcontracts
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/menghuanwd/cronos_chain_scanner.
