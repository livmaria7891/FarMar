#inheritance and composition notes

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

  def self.find(id)
    CSV.open('./support/markets.csv','r').each do |line|
      if id == line[0].to_i
        return self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
      end
    end
  end



  def vendors
    vendors = []
    CSV.open('./support/vendors.csv','r').each do |line|
      if line[3].to_i == market[:id]
        v = FarMar::Vendor.find(line[0])
        vendors << v
      end
    end
    return vendors
  end


end

#print FarMar::Market.all

# #print FarMar::Market.all
tst = FarMar::Market.find(21)
print tst.vendors
