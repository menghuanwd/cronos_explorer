# frozen_string_literal: true

module CronosChain
  class Blocks
    class << self
      def eth_block_number
        Request.new.get "?module=block&action=eth_block_number"
      end
    end
  end
end
