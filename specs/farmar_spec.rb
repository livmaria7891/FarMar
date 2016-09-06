require_relative '../far_mar.rb'

require_relative 'spec_helper.rb'

describe "Testing Farmar" do

it "Testing to make class files are connected with module file" do
    tst = FarMar::Market.new
    expect(tst.class).must_equal(FarMar::Market)
end

end
