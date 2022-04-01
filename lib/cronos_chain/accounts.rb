# frozen_string_literal: true

module CronosChain
  class Accounts
    class << self
      def eth_get_balance(address)
        Request.new.get "?module=account&action=eth_get_balance&address=#{address}"
      end

      def txlist(address)
        Request.new.get "?module=account&action=txlist&address=#{address}"
      end
    end
  end
end
