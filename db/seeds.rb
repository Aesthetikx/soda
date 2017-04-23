def ingredient
  food = Faker::Food
  "#{food.measurement} #{food.send([:ingredient, :spice].sample)}"
end

def make_instructions
  Array.new([*4..10].sample) { ingredient }.join(', ')
end

def make_recipe(company, title)
  company.recipes.create!(title: title, instructions: make_instructions)
end

make_recipe_for = method(:make_recipe).to_proc.curry

Company.create!(name: 'Coke').tap do |coke|
  coke.users.create!(email: 'user@cocaco.la', password: 'password')
  ['Coca-Cola', 'Sprite', 'Mellow Yellow'].each(&make_recipe_for[coke])
end

Company.create!(name: 'Pepsi').tap do |pepsi|
  pepsi.users.create!(email: 'user@pepsi.co', password: 'password')
  ['Pepsi', 'Mountain Dew', 'Mug Root Beer'].each(&make_recipe_for[pepsi])
end
