# frozen_string_literal: true

module CronosChainScanner
  class Accounts
    class << self
      DEFAULT_HASH = { module: 'account' }.freeze

      def eth_get_balance(address)
        hash = DEFAULT_HASH.merge(action: 'eth_get_balance', address: address)

        Request.get hash
      end

      def balance(address)
        hash = DEFAULT_HASH.merge(action: 'balance', address: address)

        Request.get hash
      end

      def txlist(address, starttimestamp = nil, sort = 'desc')
        hash = DEFAULT_HASH.merge(action: 'txlist', address: address, starttimestamp: starttimestamp, sort: sort)

        Request.get hash
      end

      def tokenbalance(contractaddress, address)
        hash = DEFAULT_HASH.merge(action: 'tokenbalance', contractaddress: contractaddress, address: address)

        Request.get hash
      end
    end
  end
end
