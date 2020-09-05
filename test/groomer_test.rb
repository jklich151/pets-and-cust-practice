require 'minitest/autorun'
require 'minitest/pride'
require './lib/groomer'
require './lib/customer'
require './lib/pet'

class GroomerTest < Minitest::Test
  def test_it_exists
    groomer = Groomer.new("The Hair Ball")
    assert_instance_of Groomer, groomer
  end

  def test_it_has_a_name
    groomer = Groomer.new("The Hair Ball")
    assert_equal "The Hair Ball", groomer.name
  end

  def test_it_starts_with_no_customers
    groomer = Groomer.new("The Hair Ball")
    assert_equal [], groomer.customers
  end

  def test_it_can_add_customers
    groomer = Groomer.new("The Hair Ball")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal [joel, billy], groomer.customers
  end

  def test_it_can_count_the_number_of_pets_of_a_certain_type
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal 2, groomer.number_of_pets(:cat)
  end

  def test_it_can_list_customers_with_outstanding_balances
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal [joel], groomer.customers_with_oustanding_balances
  end

  def test_groomers_have_customers_with_pets
    groomer = Groomer.new("The Hair Ball")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)

    assert_equal [], groomer.customers
  end
end
