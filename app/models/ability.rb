
class Ability < ActiveRecord::Base
  # Non-relational Attributes: name (string)
                              # description (text)
  # Has and belongs to many characters, base_classes, and prestige_classes
  validates_with UniversalValidator
  validates :description, presence: {message: "cannot be blank."}

  has_and_belongs_to_many :characters
  has_and_belongs_to_many :base_classes
  has_and_belongs_to_many :prestige_classes

end
