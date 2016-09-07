#gems
require 'csv'

#namespace module
module FarMar
  def self.all
    #return collection of instances, representing all of the objects described in CSV
  end

  def self.find(id)
    #returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  end

end

#all data classes within module
require_relative 'lib/farmar_vendor.rb'
require_relative 'lib/farmar_market.rb'
require_relative 'lib/farmar_sales.rb'
require_relative 'lib/farmar_product.rb'
