class DayCare
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_customer(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def hungry_pets
    @customers.map do |customer|
      customer.pets.find_all do |pet|
        pet.fed? == false
      end
    end.flatten
  end
end
