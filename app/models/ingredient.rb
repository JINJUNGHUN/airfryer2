class Ingredient < ApplicationRecord
  belongs_to :post

  PLACEHOLDERS = ['P1', 'P2', 'P3', 'P4', 'P5']
end
