# frozen_string_literal: true

require_relative "cronos_chain_scanner/version"
require_relative "cronos_chain_scanner/request"
require_relative "cronos_chain_scanner/accounts"
require_relative "cronos_chain_scanner/transactions"
require_relative "cronos_chain_scanner/blocks"

module CronosChainScanner
  class Error < StandardError; end
  # Your code goes here...
  
  class << self
    # attr_reader :net
    attr_writer :net
    
    def domain
      case @net
      when 'main'
        'https://cronos.org/explorer/api'
      when 'testnet3'
        'https://cronos.org/explorer/testnet3/api'
      else
        raise 'error net, only testnet3 and main'
      end
    end
  end
end
