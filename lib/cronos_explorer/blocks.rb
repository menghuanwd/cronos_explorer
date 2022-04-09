# frozen_string_literal: true

module CronosExplorer
  class Blocks
    class << self
      DEFAULT_HASH = { module: 'block' }.freeze

      def eth_block_number
        hash = DEFAULT_HASH.merge(action: 'eth_block_number')

        Request.get hash
      end

      def getblockreward(blockno)
        hash = DEFAULT_HASH.merge(action: 'getblockreward', blockno: blockno)

        Request.get hash
      end
    end
  end
end
