# frozen_string_literal: true

module CronosChain
  class Transactions

    class << self
      def gettxreceiptstatus(txhash)
        Request.new.get "?module=transaction&action=gettxreceiptstatus&txhash=#{txhash}&tag=latest"
      end

      def gettxinfo(txhash)
        Request.new.get "?module=transaction&action=gettxinfo&txhash=#{txhash}"
      end
    end
  end
end
