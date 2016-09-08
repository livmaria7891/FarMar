#try using let or before

require_relative '../far_mar.rb'

require_relative 'spec_helper.rb'

describe "Testing Farmar" do

  it "Check that a new Market instance can be created" do
    tst = FarMar::Market.new(1,2,3,4,5,6,7)
    expect(tst.class).must_equal(FarMar::Market)
  end

  it "Check that a new Vendor instance can be created" do
    tst = FarMar::Vendor.new(1,2,3,4)
    expect(tst.class).must_equal(FarMar::Vendor)
  end

  it "Check that a new Sales instance can be created" do
    skip
    tst = FarMar::Sales.new(1,2,3,4,5)
    expect(tst.class).must_equal(FarMar::Sales)
  end

  it "Check that a new Product instance can be created" do
    tst = FarMar::Product.new(1,2,3)
    expect(tst.class).must_equal(FarMar::Product)
  end

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

  it "Tests FarMar::Market.vendor returns an array" do
    #skip
    tst = FarMar::Market.find(21)
      expect(tst.vendors.class).must_equal(Array)
  end

  it "Tests FarMar::Vendor.markets returns an array" do
    #skip
    tst = FarMar::Vendor.find(1)
      expect(tst.market.class).must_equal(Array)
  end

  it "Tests FarMar::Vendor.product returns an array" do
    #skip
    tst = FarMar::Vendor.find(1)
      expect(tst.products.class).must_equal(Array)
  end

  it "Tests FarMar::Vendor.by_market returns an array" do
    #skip
      expect(FarMar::Vendor.by_market(1).class).must_equal(Array)
  end








end
