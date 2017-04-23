class Company < ApplicationRecord
  has_many :recipes
  has_many :users
end
