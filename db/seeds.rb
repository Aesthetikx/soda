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

Company.create!(name: 'Coke')
['Coca-Cola', 'Sprite', 'Mellow Yellow'].each(&method(:make_recipe))

Company.create!(name: 'Pepsi')
['Pepsi', 'Mountain Dew', 'Mug Root Beer'].each(&method(:make_recipe))
