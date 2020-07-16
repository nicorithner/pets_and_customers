class  Veterinarian
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customer_pets(customer)
    customer.pets    
  end

  def list_all_pets
    pets = []
    @customers.each do |customer|
      customer.pets.each do |pet|
      pets <<  pet
      end
    end
    pets.reverse

    # pets = @customers.map do |customer|
    #   customer.pets
    # end.flatten
    # pets.reverse
  end

end
