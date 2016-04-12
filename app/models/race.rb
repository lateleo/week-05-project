class Race < ActiveRecord::Base
  # Non-relational attributes: name (string),
                              # age_of_adulthood (integer),
                              # stamina_index (integer),
                              # strength_index (integer),
                              # agility_index (integer),
                              # spell_power_index (integer),
                              # wit_index (integer),
                              # flavor_text (text, optional)
  # Has many characters and racial_abilities
  validates :name, presence: {message: "cannot be blank."}
  validates :age_of_adulthood, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than_or_equal_to: 0, message: "must be positive."}
  validates :stamina_index, numericality:
    {greater_than_or_equal_to: -3, less_than_or_equal_to: 3, message: "must be between -3 and 3, inclusive."}
  validates :strength_index, numericality:
    {greater_than_or_equal_to: -3, less_than_or_equal_to: 3, message: "must be between -3 and 3, inclusive."}
  validates :agility_index, numericality:
    {greater_than_or_equal_to: -3, less_than_or_equal_to: 3, message: "must be between -3 and 3, inclusive."}
  validates :spell_power_index, numericality:
    {greater_than_or_equal_to: -3, less_than_or_equal_to: 3, message: "must be between -3 and 3, inclusive."}
  validates :wit_index, numericality:
    {greater_than_or_equal_to: -3, less_than_or_equal_to: 3, message: "must be between -3 and 3, inclusive."}
  validate :validate_indices

  has_many :characters
  has_many :racial_abilities

  def validate_indices
    sum = stamina_index + strength_index + agility_index + spell_power_index + wit_index
    errors.add(:stat_indices, "must add up to 0.") if sum != 0
  end
end
