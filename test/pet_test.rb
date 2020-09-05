require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'

class PetTest < Minitest::Test
  def test_it_exists
    samson = Pet.new({name: "Samson", type: :dog})

    assert_instance_of Pet, samson
  end

  def test_it_has_attributes
    samson = Pet.new({name: "Samson", type: :dog})

    assert_equal "Samson", samson.name
    assert_equal :dog, samson.type
  end

  def test_it_is_not_fed_by_default
    samson = Pet.new({name: "Samson", type: :dog})

    assert_equal false, samson.fed?
  end

  def test_it_can_be_fed
    samson = Pet.new({name: "Samson", type: :dog})

    samson.feed

    assert_equal true, samson.fed?
  end
end
