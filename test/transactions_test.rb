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

  def test_gettxinfo
    res_doc = CronosExplorer::Transactions.gettxinfo(@transfer_txhash)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result']['from'], @address.downcase
    assert_equal res_doc['result']['value'].to_i, 1.3 * 10**18
    assert_equal res_doc['result']['success'], true


    res_doc = CronosExplorer::Transactions.gettxinfo(@swap_txhash)
    # puts res_doc

    assert_equal res_doc['message'], 'OK'
    assert_equal res_doc['result']['from'], @address.downcase
    assert_equal res_doc['result']['value'].to_i, 0
    assert_equal res_doc['result']['success'], true
    assert_equal res_doc['result']['logs'].size, 6
  end

  def test_getstatus
    res_doc = CronosExplorer::Transactions.getstatus(@transfer_txhash)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end

  def test_gettxreceiptstatus
    res_doc = CronosExplorer::Transactions.gettxreceiptstatus(@transfer_txhash)

    # puts res_doc

    assert_equal res_doc['message'], 'OK'
  end
end
