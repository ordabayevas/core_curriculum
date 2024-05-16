# class Pet
#   attr_reader :name, :type

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name
#   attr_reader :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets
#     pets.size
#   end
# end

# class Shelter
#   def initialize
#     @owners = []
#   end

#   def adopt(owner, pet)
#     if !@owners.include?(owner)
#       @owners << owner
#     end

#     owner.pets << [pet.name, pet.type]

#   end

#   def print_adoptions
#     @owners.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.pets.each do |name, type|
#         puts "a #{type} named #{name}"
#       end
#     end
#   end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# Further Exploration
class Pet
  attr_reader :name, :type
  @@total_pets = {}

  def initialize(type, name)
    @type = type
    @name = name
    @@total_pets[name] = type
  end

  def self.total_pets
    @@total_pets
  end
end

class Owner
  attr_reader :name
  attr_reader :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    if !@owners.include?(owner)
      @owners << owner
    end

    owner.pets << [pet.name, pet.type]
    Pet.total_pets.delete(pet.name)

  end

  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |name, type|
        puts "a #{type} named #{name}"
      end
    end
  end

  def unadopted_pets
    puts "The Animal shelter has #{Pet.total_pets.size} unadopted pets."
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta      = Pet.new('dog', 'Asta')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.unadopted_pets