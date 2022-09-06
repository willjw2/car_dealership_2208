class Dealership
  attr_reader :inventory, :inventory_count
  def initialize(name, address)
    @inventory = []
    @inventory_count = 0
    @address = address
  end
  def add_car(car)
    @inventory << car
    @inventory_count += 1
  end
  def has_inventory?
    !@inventory.empty?
  end
  def cars_by_make(make)
    @inventory.select do |car|
      car.make == make
    end
  end
  def total_value
    value = 0
    @inventory.each do |car|
      value += car.total_cost
    end
    value
  end
  def details
    {"total_value" => total_value, "address" => @address}
  end
  def average_price_of_car
    price = (self.total_value / @inventory.length)
    price.to_s.reverse.scan(/.{1,3}/).join(',').reverse
  end
  def cars_sorted_by_price
    @inventory.sort_by {|car| car.total_cost}
  end
  def inventory_hash
    hash = {}
    @inventory.each do |car|
      if hash[car.make] == nil
        hash[car.make] = [car]
      else
        hash[car.make] << car
      end
    end
    hash
  end
end
