class BaseClass < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                              # role (string),
                              # armor_type (string)
                              # stamina_index (integer),
                              # strength_index (integer),
                              # agility_index (integer),
                              # spell_power_index (integer),
                              # wit_index (integer),
                              # flavor_text (text, optional)
  # Has many abilities and characters
#  validates_with UniversalValidator
  validates :role, presence: {message: "cannot be blank."}
  validates :armor_type, presence: {message: "cannot be blank."}
  validates :stamina_index, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 3, message: "must be between 0 and 3, inclusive."}
  validates :strength_index, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 3, message: "must be between 0 and 3, inclusive."}
  validates :agility_index, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 3, message: "must be between 0 and 3, inclusive."}
  validates :spell_power_index, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 3, message: "must be between 0 and 3, inclusive."}
  validates :wit_index, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 3, message: "must be between 0 and 3, inclusive."}

  has_and_belongs_to_many :abilities
  has_many :characters

end
