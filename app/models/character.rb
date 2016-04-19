class Character < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                            # age (integer),
                            # base_level (integer, 1 or greater),
                            # character_level (integer, greater than or equal to base_level)
                            # stamina (integer),
                            # strength (integer),
                            # agility (integer),
                            # spell_power (integer),
                            # wit (integer),
                            # backstory (text, optional)
  # Has exactly one base_class, race, and racial_ability

  # Age threshold set at 18 for now, will later redefine to age of adulthood for the given race
  validates_with UniversalValidator
  validates :age, presence: {message: "cannot be blank."}
  validates :base_level, presence: {message: "cannot be blank."},
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
  validates :base_class_id, presence: {message: "cannot be blank."}
  validates :race_id, presence: {message: "cannot be blank."}
#  validates :racial_ability_id, presence: {message: "cannot be blank."}
  validate :validate_age

  before_validation :set_character_level

  belongs_to :base_class
  belongs_to :race
  belongs_to :racial_ability
  has_many :prestige_levels
  has_many :prestige_classes, through: :prestige_levels
  has_and_belongs_to_many :abilities

  def set_character_level
    self.character_level = base_level
    self.prestige_levels.each { |prestige_level| self.character_level += prestige_level.levels}
  end

  def validate_age
    if Race.find_by_id(race_id).age_of_adulthood > age
      errors.add(:age, "of #{race.name} must be greater than or equal to #{race.age_of_adulthood}.")
    end
  end

  def stats
    stats = {"Stamina" => "stamina",
              "Strength" => "strength",
              "Agility" => "agility",
              "Spell Power" => "spell_power",
              "Wit" => "wit"}
  end

  def new_with(params)
    self.name = params['name']
    self.age = params['age']
    self.race_id = params['race_id']
    self.base_class_id = params['base_class_id']
    self.base_level = 1
    self.racial_ability_id = params['racial_ability_id']
    self.abilities << Ability.find_by_id(params['ability_id1']) if !abilities.include?(Ability.find_by_id(params['ability_id1']))
    self.abilities << Ability.find_by_id(params['ability_id2']) if !abilities.include?(Ability.find_by_id(params['ability_id2']))
    self.stamina = params['stamina']
    self.strength = params['strength']
    self.agility = params['agility']
    self.spell_power = params['spell_power']
    self.wit = params['wit']
    self.backstory = params['backstory']
    self
  end

end
