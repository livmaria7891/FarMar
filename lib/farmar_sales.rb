require 'time'
#require 'date'
#require_relative '../far_mar.rb'

class FarMar::Sales

    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id,amount,purchase_time,vendor_id,product_id)
        @id = id.to_i
        @amount = amount.to_i
        @purchase_time =  purchase_time
        @vendor_id = vendor_id.to_i
        @product_id = product_id.to_i

    end

    def self.all
      all = []
      CSV.open('./support/sales.csv','r').each do |line|
        all << self.new(line[0],line[1],DateTime.parse(line[2]),line[3],line[4])
      end
      return all
    end

    def self.find(id)
      CSV.open('./support/sales.csv','r').each do |line|
        if id == line[0].to_i
          return self.new(line[0],line[1],line[2],line[3],line[4])
        end
      end
    end

  def vendor
    #returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id
    return FarMar::Vendor.find(@vendor_id)

  end

  def product
    #returns Product instance associated with this sale using FarMar::Sale product_id field
    return FarMar::Product.find(@product_id)
  end

  def self.between(beginning_time, end_time)
    #returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
    #come back to this. Time might be parsing wrong.
    start_time = DateTime.parse(beginning_time)
    end_time = DateTime.parse(end_time)
    all = self.all
    s = []

    all.each do |sale|
      if sale.purchase_time.between?(start_time,end_time)
        s << FarMar::Sales.find(sale.id)

      end
    end
    return s
  end

end
