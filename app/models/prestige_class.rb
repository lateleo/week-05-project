class PrestigeClass < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                              # role (string),
                              # armor_type (string),
                              # stamina_index (integer),
                              # strength_index (integer),
                              # agility_index (integer),
                              # spell_power_index (integer),
                              # wit_index (integer),
                              # entry_requirements (text),
                              # flavor_text (text, optional)
  # Has many abilities and characters
  validates_with UniversalValidator
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
    validates :entry_requirements, presence: {message: "cannot be blank."}

  has_many :prestige_levels
  has_and_belongs_to_many :abilities

  def indices
    indices = {"Stamina" => "stamina_index",
              "Strength" => "strength_index",
              "Agility" => "agility_index",
              "Spell Power" => "spell_power_index",
              "Wit" => "wit_index"}
  end

  def separate_reqs
    self.entry_requirements.split("\r\n").map{|req| req.split(":")}
  end

  def retrieve_req(criterion)
    entry_requirements.slice(/(?<=[\n\A]#{criterion}: )\d+(?=(\n|(\.)?\Z))/).to_i
  end

  def update_with(params)
    self.update_attributes(name: params['name'],
                          role: params['role'],
                          armor_type: params['armor_type'],
                          entry_requirements: params['entry_requirements'],
                          stamina_index: params['stamina_index'],
                          strength_index: params['strength_index'],
                          agility_index: params['agility_index'],
                          spell_power_index: params['spell_power_index'],
                          wit_index: params['wit_index'],
                          flavor_text: params['flavor_text'])
  end

end
