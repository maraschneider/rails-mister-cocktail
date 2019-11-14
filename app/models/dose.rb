class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, allow_blank: false
  validates :cocktail_id, :ingredient_id, presence: true
  validates :cocktail_id, :uniqueness => { :scope => :ingredient_id }

end
