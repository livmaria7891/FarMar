require_relative '../far_mar.rb'

class FarMar::Sales

    # ID - (Fixnum) uniquely identifies the sale
    # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
    # Purchase_time - (Datetime) when the sale was completed
    # Vendor_id - (Fixnum) a reference to which vendor completed the sale
    # Product_id - (Fixnum) a reference to which product was sold
    def initialize(id,amount,purchase_time,vendor_id,product_id)
      @sale = {
        id: id,
        amount: amount,
        purchase_time: purchase_time,
        vendor_id: vendor_id,
        product_id: product_id
      }
    end

    def self.all
      all = []
      CSV.open('./support/sales.csv','r').each do |line|
        all << self.new(line[0],line[1],line[2],line[3],line[4])
      end
      return all
    end

    def self.id(id)
      CSV.open('./support/sales.csv','r').each do |line|
        if id == line[0].to_i
          return self.new(line[0],line[1],line[2],line[3],line[4])
        end
      end
    end

  def vendor
    #returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id
  end

  def product
    #returns Product instance associated with this sale using FarMar::Sale product_id field
  end

  def self.between(beginning_time, end_time)
    #returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

  end

end
