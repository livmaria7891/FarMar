#inheritance and composition notes

#require_relative '../far_mar.rb'
require 'csv'

class FarMar::Market

  attr_accessor :id, :name, :address, :city, :county, :state, :zip
  def initialize(id,name,address,city,county,state,zip)

      @id = id.to_i
      @name= name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip =zip

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
    all_vendors = FarMar::Vendor.all
    all_vendors.each do |v|
      if v.market_id == @id
        v = FarMar::Vendor.find(v.id)
        vendors << v
      end
    end
    return vendors
  end


end
