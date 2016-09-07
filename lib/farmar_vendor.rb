require_relative '../far_mar.rb'

class FarMar::Vendor

  def initialize(id,name,num_of_employees,market_id)
    @vendor = {
    id: id,
    name: name,
    num_of_employees: num_of_employees,
    market_id: market_id,
    }
  end

  def self.all
    @all = []
    CSV.open('../support/vendors.csv','r').each do |line|
      @all << self.new(line[0],line[1],line[2],line[3])
    end
    return @all
  end

  def self.id(id)
    CSV.open('../support/vendors.csv','r').each do |line|
      if id.to_s == line[0]
        return self.new(line[0],line[1],line[2],line[3])
      end
    end
  end

  def market
      #returns Market instance associated with this vendor using Farmer::Vendor market_id field
  end

  def products
    #returns a collection of FarMar::Product instances associated by the FarMar::Product vendor_id
  end

  def sales
    #returns a collection of FarMar::Sale instances that are associated by the vendor_id field
  end

  def revenue
    #returns the sum of all the vendor's sales(in cents)
  end

  def self.by_market(market_id)
    #returns all the vendors with the given market_id
  end
end
