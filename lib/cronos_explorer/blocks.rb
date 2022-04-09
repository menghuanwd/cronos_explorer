# frozen_string_literal: true

module CronosExplorer
  class Blocks
    class << self
      DEFAULT_HASH = { module: 'block' }.freeze

      # Mimics Ethereum JSON RPC's eth_blockNumber. Returns the lastest block number
      def eth_block_number
        hash = DEFAULT_HASH.merge(action: 'eth_block_number')

        Request.get hash
      end

      # Get block reward by block number.
      def getblockreward(blockno)
        hash = DEFAULT_HASH.merge(action: 'getblockreward', blockno: blockno)

        Request.get hash
      end
    end
  end
end
