class Pet
  attr_reader :name, :type, :age
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @age = info[:age] = 1
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end

end