# frozen_string_literal: true

module CronosExplorer
  class Contracts
    class << self
      DEFAULT_HASH = { module: 'contract' }.freeze

      def listcontracts
        hash = DEFAULT_HASH.merge(action: 'listcontracts')

        Request.get hash
      end
    end
  end
end
