class DayCare
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def unfed_pets
    unfed_pets = []
    @customers.each do |customer|
      pet = customer.pets.find_all do |pet|
        if pet.fed? == false
          unfed_pets << pet
        end
      end
    end
    unfed_pets
  end

  def customer_by_id(id)
    customer = @customers.find {|customer| customer.id == id}
  end
end