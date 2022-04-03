require 'oj'
require 'faraday'

module CronosChain
  class Request
    DOMAIN = 'https://cronos.org/explorer/testnet3/api'

    def initialize
      @apikey = '111'
    end

    def get(url)
      puts url
      res = connect.get do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
      end.body

      Oj.load(res)
    end

    def post(url)
      res = connect.post do |req, params|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.params params
      end.body

      Oj.load(res)
    end

    def connect
      Faraday.new(url: DOMAIN) do |faraday|
        faraday.request :json
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
