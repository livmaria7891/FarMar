require_relative '../far_mar.rb'

class FarMar::Product
  def initialize(id,name,vendor)
    @product = {
      id: id.to_i,
      name: name,
      vendor: vendor.to_i
    }
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
