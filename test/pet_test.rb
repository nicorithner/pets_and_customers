require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'

class PetTest < Minitest::Test
  def test_it_exists
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    assert_instance_of Pet, samson
  end

  def test_it_has_attributes
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    assert_equal "Samson", samson.name
    assert_equal :dog, samson.type
    assert_equal 3, samson.age

  end

  def test_it_is_not_fed_by_default
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    assert_equal false, samson.fed?
  end

  def test_it_can_be_fed
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    samson.feed
    assert_equal true, samson.fed?
  end
end
