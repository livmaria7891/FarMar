#require_relative '../far_mar.rb'

class FarMar::Product
  attr_accessor :id, :name, :vendor_id

  def initialize(id,name,vendor)
      @id = id.to_i
      @name = name
      @vendor_id = vendor.to_i
    end

  def self.all
    all = []
    CSV.open('./support/products.csv','r').each do |line|
      all << self.new(line[0],line[1],line[2])
    end
    return all
  end

  def self.find(id)
    CSV.open('./support/products.csv','r').each do |line|
      if id == line[0].to_i
        return self.new(line[0],line[1],line[2])
      end
    end
  end

  def vendor
    #returns Vendor instance associated with this vendor using the FarMar::Product vendor_id field
    vendors = FarMar::Vendor.all
      vendors.each do |v|
        if vendor_id == v.id
          the_vendor = FarMar::Vendor.find(vendor_id)
          return the_vendor
        end
      end
  end

  def sales
    #returns collection of FarMar::Sale instances that are associated using the FarMar::Sale Product_id field
    all_sales = FarMar::Sales.all
    product_sales = []
    all_sales.each do |s|
      if id == s.product_id
        product_sales << FarMar::Sales.find(s.id)
      end
    end
    return product_sales
  end

  def number_of_sales
    #returns number of times this Product has been sold
    return sales.length
  end

  def self.by_vendor(vendor_id)
    #returns all the products with the given vendor_id
    v = FarMar::Vendor.find(vendor_id)
    return v.products
  end

end
