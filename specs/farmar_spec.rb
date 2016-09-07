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
    tst = FarMar::Sales.new(1,2,3,4,5)
    expect(tst.class).must_equal(FarMar::Sales)
end

it "Check that a new Product instance can be created" do
    tst = FarMar::Product.new(1,2,3)
    expect(tst.class).must_equal(FarMar::Product)
end
end
