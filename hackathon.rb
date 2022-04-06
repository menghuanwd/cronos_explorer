require 'cronos_chain_scanner'
require 'active_support'

CronosChainScanner.net = 'testnet3'



@address = '0x0eE92A5c08480A966B2B503821c49F936686E440'
@timestamp = (Time.now - 3.days).to_i

res_doc = CronosChainScanner::Accounts.txlist(@address, @timestamp)

puts res_doc