require 'minitest/autorun'
require 'minitest/pride'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

class DayCareTest < Minitest::Test
  def test_it_exists
    daycare = DayCare.new("Kid Care")

    assert_instance_of DayCare, daycare
  end

  def test_it_has_attributes
    daycare = DayCare.new("Kid Care")

    assert_equal "Kid Care", daycare.name
  end

  def test_can_have_customers
    daycare = DayCare.new("Kid Care")
    joel = Customer.new("Joel", 2)
    matt = Customer.new("Matt", 3)

    daycare.add_customer(joel)
    daycare.add_customer(matt)

    assert_equal [joel, matt], daycare.customers
  end

  def test_can_find_by_id
    daycare = DayCare.new("Kid Care")
    joel = Customer.new("Joel", 2)
    matt = Customer.new("Matt", 3)

    daycare.add_customer(joel)
    daycare.add_customer(matt)

    assert_equal joel, daycare.find_customer(2)
  end

  def test_pets_unfed
    daycare = DayCare.new("Kid Care")
    joel = Customer.new("Joel", 2)
    matt = Customer.new("Matt", 3)

    daycare.add_customer(joel)
    daycare.add_customer(matt)

    assert_equal [], daycare.hungry_pets

    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})

    joel.adopt(samson)
    joel.adopt(lucy)

    assert_equal [samson, lucy], daycare.hungry_pets

    samson.feed

    assert_equal [lucy], daycare.hungry_pets
  end
end
