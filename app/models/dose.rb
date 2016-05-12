class Dose < ActiveRecord::Base
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :cocktail, uniqueness: {scope: :ingredient}
  validates :ingredient, presence: true


  belongs_to :cocktail
  belongs_to :ingredient
end
