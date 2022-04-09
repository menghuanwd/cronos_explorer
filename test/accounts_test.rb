require_relative './test_helper'

class ScannersTest < Minitest::Test
  def setup
    CronosExplorer.net = 'testnet3'
    @vvs_contractaddress = '0x904bd5a5aac0b9d88a0d47864724218986ad4a3a'
    @tusd_contractaddress = '0x41315E63d0663Ce839931fed7451084613E385b3'
    @address = '0x0eE92A5c08480A966B2B503821c49F936686E440'

    # CronosExplorer.net = 'main'
    
    @swap_txhash = '0x3664a65015609c08b64499081d8dc042835129a9f34c3d8a1652e4d9cbb56543'
    @transfer_txhash = '0x5a0e9eb192be33842750082706000f0f9d44aa6e732372484d7eacb3497baa5c'
    @blockno = '2565174'
    @timestamp = 1648184128
    @timestamp2 = 1748184128
    sleep 0.5
  end

  def test_eth_get_balance
    res_doc = CronosExplorer::Accounts.eth_get_balance(@address)

    # puts res_doc
    assert_equal res_doc['id'], 0
    assert_equal res_doc['result'].hex, 28775150000000000000
  end

  def test_balance
    res_doc = CronosExplorer::Accounts.balance(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result'], '28775150000000000000'
  end

  def test_txlist
    res_doc = CronosExplorer::Accounts.txlist(@address, @timestamp)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
    assert_equal res_doc['result'].size, 9


    res_doc = CronosExplorer::Accounts.txlist(@address, @timestamp2)
    # puts res_doc

    assert_equal res_doc['message'], 'No transactions found'
    assert_equal res_doc['status'], '0'
  end

  def test_tokenbalance
    res_doc = CronosExplorer::Accounts.tokenbalance(@vvs_contractaddress, @address)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result'], '975286044859734714700895'


    res_doc = CronosExplorer::Accounts.tokenbalance(@tusd_contractaddress, @address)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result'], '99997450000000000000000'
  end

  def test_tokenlist
    res_doc = CronosExplorer::Accounts.tokenlist(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
    assert_equal res_doc['result'].size, 2
  end

  def test_tokentx
    res_doc = CronosExplorer::Accounts.tokentx(@address)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['status'], '1'
    assert_equal res_doc['result'][0]['from'], '0x0ee92a5c08480a966b2b503821c49f936686e440'
  end
end
