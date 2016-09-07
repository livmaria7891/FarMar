require_relative '../far_mar.rb'

class FarMar::Product
  def initialize(id,name,vendor)
    @product = {
      id: id.to_i,
      name: name,
      vendor: vendor.to_i
    }
  end

  def self.all
    all = []
    CSV.open('./support/products.csv','r').each do |line|
      all << self.new(line[0],line[1],line[2])
    end
    return all
  end

  def self.id(id)
    CSV.open('./support/products.csv','r').each do |line|
      if id == line[0].to_i
        return self.new(line[0],line[1],line[2])
      end
    end
  end

  def vendor
    #returns Vendor instance associated with this vendor using the FarMar::Product vendor_id field
  end

  def sales
    #returns collection of FarMar::Sale instances that are associated using the FarMar::Sale Product_id field
  end

  def number_of_sales
    #returns number of times this Product has been sold
  end

  def self.by_vendor(vendor_id)
    #returns all the products with the given vendor_id
  end
end
