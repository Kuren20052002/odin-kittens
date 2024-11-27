class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :softness, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
