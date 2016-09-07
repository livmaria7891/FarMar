require_relative '../far_mar.rb'
require 'csv'

class FarMar::Market

  attr_accessor :market
  def initialize(id,name,address,city,county,state,zip)
    @market = {
      id: id.to_i,
      name: name,
      address: address,
      city: city,
      county: county,
      state: state,
      zip: zip,
    }
  end

  def self.all
    all = []
    CSV.open('./support/markets.csv','r').each do |line|
      all << self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
    end
    return all
  end

  def self.id(id)
    CSV.open('../support/markets.csv','r').each do |line|
      if id == line[0]
        return self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
      end
    end
  end



  def vendors
    vendors = []
    CSV.open('../support/vendors.csv','r').each do |line|
      if line[3] == market[:id]
        v = FarMar::Vendor.id(line[0])
        vendors << v
      end
    end
    return vendors
  end


end

#print FarMar::Market.all
#print tst.vendors.inspect
# #print FarMar::Market.all
# #print FarMar::Market.id(21)
