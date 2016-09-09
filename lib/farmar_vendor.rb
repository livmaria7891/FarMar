#require_relative '../far_mar.rb'


class FarMar::Vendor

  attr_accessor :id, :name, :num_of_employees, :market_id

  def initialize(id,name,num_of_employees,market_id)

    @id = id.to_i
    @name = name
    @num_of_employees = num_of_employees
    @market_id = market_id.to_i

  end

  def self.all
    all = []
    CSV.open('./support/vendors.csv','r').each do |line|
      all << self.new(line[0],line[1],line[2],line[3])
    end
    return all
  end

  def self.find(id)
    CSV.open('./support/vendors.csv','r').each do |line|
      if id.to_s == line[0]
        return self.new(line[0],line[1],line[2],line[3])
      end
    end
  end

  def market
      #returns Market instance associated with this vendor using Farmer::Vendor market_id field
      markets = []
      all_markets = FarMar::Market.all
        all_markets.each do |market|
        if market.id == @market_id
          markets << FarMar::Market.find(@market_id)
        end
      end
      return markets
  end

  def products
    #returns a collection of FarMar::Product instances associated by the FarMar::Product vendor_id
    products = []
    all_products = FarMar::Product.all
      all_products.each do |product|
       if product.vendor_id == @id
         products << FarMar::Product.find(product.id)
      end
    end
    return products
  end

  def sales
    #returns a collection of FarMar::Sale instances that are associated by the vendor_id field
      all_sales = FarMar::Sales.all
      vendor_sales = []
      all_sales.each do |s|
        if id == s.vendor_id
          vendor_sales << FarMar::Sales.find(s.id)
        end
      end
      return vendor_sales
  end

  def revenue
    #returns the sum of all the vendor's sales(in cents)
    revenue = 0
    sales = self.sales
    sales.each do |sale|
     revenue += sale.amount
    end
    return revenue
  end

  def self.by_market(market_id)
    #returns all the vendors with the given market_id
    market = FarMar::Market.find(market_id)
    return market.vendors
  end
end
