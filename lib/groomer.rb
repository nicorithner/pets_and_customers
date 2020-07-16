class Groomer
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
    @customers_with_oustanding_balances = []
  end
  
  def add_customer(customer)
    @customers << customer
  end

  def number_of_pets(pet_type)
    pets = []
    @customers.find_all do |customer|
      pets << pet_type == customer.pets
    end
    pets.count
  end

  def customers_with_oustanding_balances
    @customers_with_oustanding_balances = @customers.map do |customer|
      if customer.outstanding_balance != 0
        customer
      end
    end.compact
  end
    
end