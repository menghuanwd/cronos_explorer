# frozen_string_literal: true

module CronosChain
  class Blocks
    class << self
      DEFAULT_HASH = { module: 'block' }.freeze

      def eth_block_number
        hash = DEFAULT_HASH.merge(action: 'eth_block_number')

        Request.get hash
      end
    end
  end
end
