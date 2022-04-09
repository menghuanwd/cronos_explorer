# frozen_string_literal: true

module CronosExplorer
  class Accounts
    class << self
      DEFAULT_HASH = { module: 'account' }.freeze

      # Mimics Ethereum JSON RPC's eth_getBalance. Returns the balance as of the provided block (defaults to latest)
      def eth_get_balance(address)
        hash = DEFAULT_HASH.merge(action: 'eth_get_balance', address: address)

        Request.get hash
      end

=begin
      Get balance for address. Also available through a GraphQL 'addresses' query. 
      If the balance hasn't been updated in a long time, 
      we will double check with the node to fetch the absolute latest balance. 
      This will not be reflected in the current request, but once it is updated, 
      subsequent requests will show the updated balance. 
      If you want to know whether or not we are checking for another balance, use the `balancemulti` action. 
      That contains a property called `stale` that will let you know to recheck that balance in the near future.
=end
      def balance(address)
        hash = DEFAULT_HASH.merge(action: 'balance', address: address)

        Request.get hash
      end

      # Get transactions by address. Up to a maximum of 10,000 transactions. Also available through a GraphQL 'address' query.
      def txlist(address, starttimestamp = nil, sort = 'desc')
        hash = DEFAULT_HASH.merge(action: 'txlist', address: address, starttimestamp: starttimestamp, sort: sort)

        Request.get hash
      end

      # Get token transfer events by address. Up to a maximum of 10,000 token transfer events. Also available through a GraphQL 'token_transfers' query.
      def tokentx(address)
        hash = DEFAULT_HASH.merge(action: 'tokentx', address: address)

        Request.get hash
      end

      # Get token account balance for token contract address.
      def tokenbalance(contractaddress, address)
        hash = DEFAULT_HASH.merge(action: 'tokenbalance', contractaddress: contractaddress, address: address)

        Request.get hash
      end

      # Get list of tokens owned by address.
      def tokenlist(address)
        hash = DEFAULT_HASH.merge(action: 'tokenlist', address: address)

        Request.get hash
      end
    end
  end
end
