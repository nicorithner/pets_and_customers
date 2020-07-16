require 'minitest/autorun'
require 'minitest/pride'
require './lib/groomer'
require './lib/customer'
require './lib/pet'
require './lib/veterinarian'
require "pry"
class VeterinarianTest < MiniTest::Test

  def test_it_exists
    vet = Veterinarian.new("Mary")
    assert_instance_of Veterinarian, vet
  end

  def test_it_starts_with_no_customers
    # skip
    vet = Veterinarian.new("Mary")

    assert_equal [], vet.customers
  end

  def test_it_can_add_customers
    # skip
    vet = Veterinarian.new("Mary")

    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)

    vet.add_customer(joel)
    vet.add_customer(billy)

    assert_equal [joel, billy], vet.customers
  end

  def test_vet_customers_can_have_multiple_pets
    # skip
    vet = Veterinarian.new("Mary")

    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)

    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)

    vet.add_customer(joel)
    vet.add_customer(billy)

    assert_equal [samson, lucy], vet.customer_pets(joel)
  end

  def test_vet_pets_under_their_care_can_be_listed_by_age_descending
    # skip
    vet = Veterinarian.new("Mary")

    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)

    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 4})
    joel.adopt(samson)
    joel.adopt(lucy)
    
    molly = Pet.new({name: "Molly", type: :cat, age: 7})
    billy.adopt(molly)

    vet.add_customer(joel)
    vet.add_customer(billy)

    assert_equal [molly, lucy, samson], vet.list_all_pets
  end

  def test_vet_can_count_each_customers_pets
    # skip
    vet = Veterinarian.new("Mary")

    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)

    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 4})
    joel.adopt(samson)
    joel.adopt(lucy)
    
    molly = Pet.new({name: "Molly", type: :cat, age: 7})
    billy.adopt(molly)

    vet.add_customer(joel)
    vet.add_customer(billy)

    assert_equal 2, vet.total_customer_pets(joel)

  end

  def test_vet_can_count_all_customer_pets
    # skip
    vet = Veterinarian.new("Mary")

    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)

    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 4})
    joel.adopt(samson)
    joel.adopt(lucy)
    
    molly = Pet.new({name: "Molly", type: :cat, age: 7})
    billy.adopt(molly)

    vet.add_customer(joel)
    vet.add_customer(billy)

    assert_equal 3, vet.total_customers_pets

  end
end
