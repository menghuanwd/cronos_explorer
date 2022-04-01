require './test_helper'

class AccountsTest < Minitest::Test
  def setup
    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'
  end

  def test_balance
    res_doc = CronosChain::Accounts.eth_get_balance(@address)

    assert_equal res_doc['id'], 0
  end

  def test_eth_block_number
    res_doc = CronosChain::Blocks.eth_block_number

    assert_equal res_doc['id'], 0
  end

  def test_eth_block_number
    res_doc = CronosChain::Accounts.txlist(@address)

    assert_equal res_doc['message'], 'OK'
  end
end
