# frozen_string_literal: true

require_relative "cronos_explorer/version"
require_relative "cronos_explorer/request"
require_relative "cronos_explorer/accounts"
require_relative "cronos_explorer/transactions"
require_relative "cronos_explorer/blocks"
require_relative "cronos_explorer/contracts"
require_relative "cronos_explorer/tokens"

module CronosExplorer
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
