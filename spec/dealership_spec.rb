require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
  end
  describe '#initialize' do
    it 'exists' do
      expect(@dealership).to be_an_instance_of(Dealership)
    end
    it 'has readable attributes' do
      expect(@dealership.inventory).to eq([])
      expect(@dealership.inventory_count).to eq(0)
    end
  end
  describe '#add_car' do
    it 'can add cars to inventory' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      expect(@dealership.inventory).to eq([@car_1, @car_2])
      expect(@dealership.inventory_count).to eq(2)
    end
  end
  describe '#has_inventory' do
    it 'can tell if it does not have inventory' do
      expect(@dealership.has_inventory?).to eq(false)
    end
    it 'can tell if it has inventory' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.has_inventory?).to eq(true)
    end
  end
  describe '#cars_by_make' do
    it 'can separate inventory cars by make' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.cars_by_make("Toyota")).to eq([@car_2, @car_3])
      expect(@dealership.cars_by_make("Ford")).to eq([@car_1])
    end
  end
  describe '#total_value' do
    it 'can add up total value of all cars in inventory' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.total_value).to eq(156000)
    end
  end
  describe '#details' do
    it 'can return a hash of dealership details' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
    end
  end
  describe '#average_price_of_car' do
    it 'can return the average price of cars in inventory' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.average_price_of_car).to eq("39,000")
    end
  end
  describe '#cars_sorted_by_price' do
    it 'can sort cars by price' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.cars_sorted_by_price).to eq([@car_3, @car_4, @car_2, @car_1])
    end
  end
  describe '#inventory_hash' do
    it 'can sort cars by make in a hash' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.inventory_hash).to eq({"Ford"=> [@car_1],
                                                "Toyota"=> [@car_2, @car_3],
                                                "Chevrolet"=> [@car_4]})
    end
  end
end
