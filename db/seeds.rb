# Apartment will run the seed file for each tenant. That makes sense, actually,
# but since we are seeding demo tenants...
if Apartment::Tenant.current == 'public'

def ingredient
  food = Faker::Food
  "#{food.measurement} #{food.send([:ingredient, :spice].sample)}"
end

def make_instructions
  Array.new([*4..10].sample) { ingredient }.join(', ')
end

def make_recipe(title)
  Recipe.create!(title: title, instructions: make_instructions)
end

coke = Company.create!(name: 'Coke', subdomain: 'coke')
coke.create_schema!
coke.activate!
['Coca-Cola', 'Sprite', 'Mellow Yellow'].each(&method(:make_recipe))

pepsi = Company.create!(name: 'Pepsi', subdomain: 'pepsi')
pepsi.create_schema!
pepsi.activate!
['Pepsi', 'Mountain Dew', 'Mug Root Beer'].each(&method(:make_recipe))

end
