# CronosExplorer

Cronos Chain Scanner

API: https://cronos.org/explorer/testnet3/api-docs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cronos_explorer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cronos_explorer

## Usage

```ruby
# set your net first

CronosExplorer.net = 'testnet3' or CronosExplorer.net = 'main' (default)
```

```ruby
CronosExplorer::Blocks.eth_block_number

CronosExplorer::Contracts.listcontracts

CronosExplorer::Accounts.eth_get_balance(@address)
CronosExplorer::Accounts.balance(@address)
CronosExplorer::Accounts.txlist(@address, starttimestamp)
CronosExplorer::Accounts.tokenbalance(@contractaddress, @address)

CronosExplorer::Transactions.gettxinfo(@txhash)
CronosExplorer::Transactions.gettxreceiptstatus(@txhash)
CronosExplorer::Transactions.getstatus(@txhash)

CronosExplorer::Tokens.getToken(@contractaddress)

CronosExplorer::Contracts.listcontracts
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gu-dave/cronos_explorer.
