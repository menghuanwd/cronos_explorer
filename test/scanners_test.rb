require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'
    @contractaddress = '0x30dd4b969668a111cd273dc8ce8fc99c5bfae794'
    @txhash = '0x3ee38e54b635b9e2863a709704e763a6764f755bcd0fac3dafc6831a07c8a7d8'
    @blockno = '2565174'
    CronosChainScanner.net = 'testnet3'
    # CronosChainScanner.net = 'main'
    sleep 0.5
  end

  def test_eth_block_number
    res_doc = CronosChainScanner::Blocks.eth_block_number

    # puts res_doc

    assert_equal res_doc['id'], 1
  end

  def test_getblockreward
    res_doc = CronosChainScanner::Blocks.getblockreward(@blockno)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_balance
    res_doc = CronosChainScanner::Accounts.eth_get_balance(@address)

    # puts res_doc

    assert_equal res_doc['id'], 0
  end

  def test_txlist
    res_doc = CronosChainScanner::Accounts.txlist(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_tokenbalance
    res_doc = CronosChainScanner::Accounts.tokenbalance(@contractaddress, @address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_gettxinfo
    res_doc = CronosChainScanner::Transactions.gettxinfo(@txhash)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_getstatus
    res_doc = CronosChainScanner::Transactions.getstatus(@txhash)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_gettxreceiptstatus
    res_doc = CronosChainScanner::Transactions.gettxreceiptstatus(@txhash)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_listcontracts
    res_doc = CronosChainScanner::Contracts.listcontracts

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_getToken
    res_doc = CronosChainScanner::Tokens.getToken(@contractaddress)

    puts res_doc

    assert_equal res_doc['message'], 'OK'
  end
end
