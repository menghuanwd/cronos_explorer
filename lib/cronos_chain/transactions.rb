# frozen_string_literal: true

module CronosChain
  class Transactions

    def gettxreceiptstatus(txhash)
      Request.new.get "?module=transaction&action=gettxreceiptstatus&txhash=#{txhash}&tag=latest"
    end
  end
end
