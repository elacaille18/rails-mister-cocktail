class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :doses

  # Callback
  before_destroy :check_for_doses

  private

  def check_for_doses
    if doses.count > 0
      errors.add_to_base("cannot delete ingredients while doses exist")
      return false
    end
  end
end
