$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "cronos_chain_scanner"

require "minitest/autorun"

def assert_gt(a, b)
  assert_operator a, :>, b
end

def assert_gte(a, b)
  assert_operator a, :>=, b
end

def assert_lt(a, b)
  assert_operator a, :<, b
end

def assert_lte(a, b)
  assert_operator a, :<=, b
end
