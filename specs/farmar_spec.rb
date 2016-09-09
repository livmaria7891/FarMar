#try using let or before

require_relative '../far_mar.rb'

require_relative 'spec_helper.rb'

describe "Testing Farmar" do

#####_______________Checks For Instances____________####


  it "Check that a new Market instance can be created" do
    tst = FarMar::Market.new(1,2,3,4,5,6,7)
    expect(tst.class).must_equal(FarMar::Market)
  end

  it "Check that a new Vendor instance can be created" do
    tst = FarMar::Vendor.new(1,2,3,4)
    expect(tst.class).must_equal(FarMar::Vendor)
  end

  it "Check that a new Sales instance can be created" do

    tst = FarMar::Sales.new(1,2,3,4,5)
    expect(tst.class).must_equal(FarMar::Sales)
  end

  it "Check that a new Product instance can be created" do
    tst = FarMar::Product.new(1,2,3)
    expect(tst.class).must_equal(FarMar::Product)
  end

#_______________________________________________________#

####________________self.all Methods_________________####
  it "Checks that self.all returns instances of each class" do
    tst = FarMar::Market.all
    expect(tst[0].class).must_equal(FarMar::Market)

    tst = FarMar::Product.all
    expect(tst[0].class).must_equal(FarMar::Product)

    tst = FarMar::Vendor.all
    expect(tst[0].class).must_equal(FarMar::Vendor)

    tst = FarMar::Sales.all
    expect(tst[0].class).must_equal(FarMar::Sales)
  end

#_________________________________________________________#

####__________________self.id methods_________________####
  it "Tests that self.id returns an instance of self" do
    tst = FarMar::Market.find(1)
    expect(tst.class).must_equal(FarMar::Market)

    tst = FarMar::Product.find(1)
    expect(tst.class).must_equal(FarMar::Product)

    tst = FarMar::Vendor.find(1)
    expect(tst.class).must_equal(FarMar::Vendor)

    tst = FarMar::Sales.find(1)
    expect(tst.class).must_equal(FarMar::Sales)

  end

####_______________Tests for FarMar::Market___________####

  it "Tests FarMar::Market.vendor returns an array" do
    #skip
    tst = FarMar::Market.find(21)
      expect(tst.vendors.class).must_equal(Array)
  end

  it "Tests FarMar::Market.vendor returns instances of vendors within the array" do
    #skip
    tst = FarMar::Market.find(21)
    arr = tst.vendors
      expect(arr[0].class).must_equal(FarMar::Vendor)
      expect(arr[0].class).wont_equal(FarMar::Market)
  end

  it "For .vendors, checks if the returned vendor instances market_ids match the given market id" do
  tst = FarMar::Market.find(21)
  arr = tst.vendors
  expect(arr[0].market_id).must_equal(21)

  tst = FarMar::Market.find(3)
  arr = tst.vendors
  expect(arr[0].market_id).must_equal(3)
end

#_______________________________________________________#

####_______________Tests for FarMar::Vendor___________####



  it "Tests FarMar::Vendor.markets returns an array" do
    #skip
    tst = FarMar::Vendor.find(1)
      expect(tst.market.class).must_equal(Array)
  end

  it "Tests FarMar::Vendor .market method returns instances of markets within the array" do
    #skip
    tst = FarMar::Vendor.find(21)
    arr = tst.market
      expect(arr[0].class).must_equal(FarMar::Market)
      expect(arr[0].class).wont_equal(FarMar::Vendor)
  end

  it "For .market, checks if the returned market instances market ids match the given market_id" do
    tst = FarMar::Vendor.find(14)
    arr = tst.market
    expect(arr[0].id).must_equal(tst.market_id)

    tst = FarMar::Vendor.find(6)
    arr = tst.market
    expect(arr[0].id).must_equal(tst.market_id)
  end

  it "Tests FarMar::Vendor .products method returns an array" do
      #skip
      tst = FarMar::Vendor.find(1)
      expect(tst.products.class).must_equal(Array)
  end

  it "Tests FarMar::Vendor .products method returns instances of Farmar::Products within the array" do
    #skip
    tst = FarMar::Vendor.find(21)
    arr = tst.products
      expect(arr[0].class).must_equal(FarMar::Product)
      expect(arr[0].class).wont_equal(FarMar::Vendor)
  end

  it "For .products, checks if the returned product instances vendor ids match the given vendor id" do
    tst = FarMar::Vendor.find(14)
    arr = tst.products
    expect(arr[0].vendor_id).must_equal(tst.id)

    tst = FarMar::Vendor.find(6)
    arr = tst.market
    expect(arr[0].id).must_equal(tst.market_id)
  end

  it "Tests FarMar::Vendor.by_market returns an array" do
    #skip
      expect(FarMar::Vendor.by_market(1).class).must_equal(Array)
  end


  it "Tests FarMar::Vendor.by_market method returns instances of vendors within the array" do
      #skip

        expect(FarMar::Vendor.by_market(1)[0].class).wont_equal(FarMar::Market)
        expect(FarMar::Vendor.by_market(1)[0].class).must_equal(FarMar::Vendor)
  end

  it "Tests FarMar::Vendor.by_market only returns vendors with the same market_id" do
    #skip
      a = FarMar::Vendor.by_market(8)[0].market_id
      b = FarMar::Vendor.by_market(8)[2].market_id
      expect(a).must_equal(b)

      c = FarMar::Vendor.by_market(10)[0].market_id
      d = FarMar::Vendor.by_market(10)[1].market_id
      expect(a).must_equal(b)

  end

  it "Tests FarMar::Vendor.by_market only returns vendors with the given market_id" do
    #skip
      a = FarMar::Vendor.by_market(8)[0].market_id
      expect(a).must_equal(8)

      c = FarMar::Vendor.by_market(10)[0].market_id
      expect(c).must_equal(10)

  end

#_________________________________________________________#

####__________FarMar::Product tests_____________####

  it "Tests FarMar::Product vendor method returns a single instance of vendor" do
    tst = FarMar::Product.find(1)
    expect(tst.vendor.class).must_equal(FarMar::Vendor)
    expect(tst.vendor.class).wont_equal(Array)
  end

  it "Tests FarMar::Product vendor method returns an instance of vendor with the product's vendor id" do
    tst = FarMar::Product.find(1)
    product_vendor_id = tst.vendor_id
    expect(tst.vendor.id).must_equal(product_vendor_id)
  end

  it "Tests FarMar::Product.by_vendor(vendor_id) method returns an array" do
    tst = FarMar::Product.find(1)
    expect(FarMar::Product.by_vendor(tst.vendor_id).class).must_equal(Array)
  end

  it "Tests FarMar::Product .sales method returns an array" do
      #skip
      tst = FarMar::Product.find(1)
      expect(tst.sales.class).must_equal(Array)
  end

  it "Tests FarMar::Product .sales method returns instances of Farmar::Sales within the array" do
    #skip
    tst = FarMar::Product.find(2)
    arr = tst.sales
      expect(arr[0].class).must_equal(FarMar::Sales)
      expect(arr[0].class).wont_equal(FarMar::Vendor)
  end

  it "Tests FarMar::Product .sales only returns vendors with the given product_id" do
    #skip
      a = FarMar::Product.find(7)
      expect(a.sales[0].product_id).must_equal(a.id)

      b = FarMar::Product.find(13)
      expect(b.sales[0].product_id).must_equal(b.id)
    end

    it "Tests FarMar::Product .number_of_sales method returns a Fixnum" do
      #skip
      tst = FarMar::Product.find(2)
      sales = tst.number_of_sales
      expect(sales.class).must_equal(Fixnum)
    end


    it "Tests FarMar::Product.by_vendor method returns the correct number of products" do
        #skip
        expect(FarMar::Product.by_vendor(1).length).must_equal(1)

        expect(FarMar::Product.by_vendor(8).length).must_equal(4)

        expect(FarMar::Product.by_vendor(8).length).wont_equal(1)
    end
#__________________________________________#

####_______FarMar::Sales test__________####

it "Tests FarMar::Sales .vendor returns an instance of FarMar::Vendor" do
    #skip
    tst = FarMar::Sales.find(1)
    expect(tst.vendor.class).must_equal(FarMar::Vendor)

end

it "Tests that in FarMar::Sales .vendor the vendor_id of the Sales instance matches the returned vendor id" do
    #skip
    tst = FarMar::Sales.find(1)
    a = tst.vendor_id
    b = tst.vendor.id
    expect(a).must_equal(b)
end

it "Tests FarMar::Sales .product returns an instance of FarMar::Product" do
    #skip
    tst = FarMar::Sales.find(1)
    expect(tst.product.class).must_equal(FarMar::Product)
end

it "Tests that in FarMar::Sales .product the product_id of the Sales instance matches the returned product id" do
    #skip
    tst = FarMar::Sales.find(1)
    a = tst.product_id
    b = tst.product.id
    expect(a).must_equal(b)
end

it "Tests FarMar::Sales .between method returns an array" do
    #skip
    expect(FarMar::Sales.between("2013-11-06 12:31:00 -0800","2013-11-06 14:31:41 -0800").class).must_equal(Array)
end

it "Tests FarMar::Sales .between method returns an array of FarMar::Sales instances" do
    #skip
    expect(FarMar::Sales.between("2013-11-06 12:31:00 -0800","2013-11-06 14:31:41 -0800")[0].class).must_equal(FarMar::Sales)
end

end
