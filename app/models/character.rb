class Character < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                            # age (integer),
                            # level (integer, default is 1),
                            # stamina (integer),
                            # strength (integer),
                            # agility (integer),
                            # spell_power (integer),
                            # wit (integer),
                            # backstory (text, optional)
  # Has exactly one class, race, and racial_ability

  validates :name, presence: {message: "cannot be blank."}
  # Age threshold set at 18 for now, will later redefine to age of adulthood for the given race
  validates :age, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than_or_equal_to: 18, message: "must be an adult."}
  validates :level, presence: {message: "cannot be blank."},
    numericality: {greater_than: 0, message: "must be positive."}
  validates :stamina, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than: 0, message: "must be positive."}
  validates :strength, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than: 0, message: "must be positive."}
  validates :agility, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than: 0, message: "must be positive."}
  validates :spell_power, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than: 0, message: "must be positive."}
  validates :wit, presence: {message: "cannot be blank."},
    numericality: {allow_nil: true, greater_than: 0, message: "must be positive."}
  validates :class_id, presence: {message: "cannot be blank."}
  validates :race_id, presence: {message: "cannot be blank."}
  validates :racial_ability_id, presence: {message: "cannot be blank."}

  belongs_to :base_class
  belongs_to :race
  belongs_to :racial_ability
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :prestige_classes

end
