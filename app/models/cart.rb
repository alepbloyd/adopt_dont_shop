class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def count
    @contents.length
  end

  def add_pet(id)
    @contents[id.to_s] = count + 1
  end

  def pet_name(id)
    Pet.find(id).name
  end

end