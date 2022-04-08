require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    CronosChainScanner.net = 'testnet3'
    # CronosChainScanner.net = 'main'

    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'
    @contractaddress = '0x30dd4b969668a111cd273dc8ce8fc99c5bfae794'
    @txhash = '0x3664a65015609c08b64499081d8dc042835129a9f34c3d8a1652e4d9cbb56543'
    @blockno = '2565174'
    @timestamp = 1648184128
    @timestamp2 = 1748184128
    sleep 0.5
  end

  def test_eth_block_number
    res_doc = CronosChainScanner::Blocks.eth_block_number

    puts res_doc

    assert_equal res_doc['id'], 1
    assert_gt res_doc['result'].hex, "0x2724fd".hex  
  end

  def test_getblockreward
    res_doc = CronosChainScanner::Blocks.getblockreward(@blockno)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_eth_get_balance
    res_doc = CronosChainScanner::Accounts.eth_get_balance(@address)

    puts res_doc

    assert_equal res_doc['id'], 0
    puts res_doc['result'].hex
    assert_equal res_doc['result'].hex, "0x24a6778efc388b000".hex
  end

  def test_balance
    res_doc = CronosChainScanner::Accounts.balance(@address)

    puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result'], "31284110000000000000"
  end

  def test_txlist
    res_doc = CronosChainScanner::Accounts.txlist(@address, @timestamp)

    puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
    assert_equal res_doc['result'].size, 2
  end

  def test_txlist_no_transactions
    res_doc = CronosChainScanner::Accounts.txlist(@address, @timestamp2)

    puts res_doc

    assert_equal res_doc['message'], 'No transactions found'
    assert_equal res_doc['status'], '0'
  end

  def test_tokenbalance
    res_doc = CronosChainScanner::Accounts.tokenbalance(@contractaddress, @address)

    puts res_doc

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
