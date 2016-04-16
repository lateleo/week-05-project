class Ability < ActiveRecord::Base
  # Non-relational Attributes: name (string)
                              # description (text)
  # Has and belongs to many characters, base_classes, and prestige_classes
  validates_with UniversalValidator
  validates :in_game_effect, presence: {message: "cannot be blank."}
  validates :flavor_text, presence: {message: "cannot be blank."}
  validates :cooldown, presence: {message: "cannot be blank."}

  has_and_belongs_to_many :characters
  has_and_belongs_to_many :base_classes
  has_and_belongs_to_many :prestige_classes

  def update_with(params)
    self.update_attributes(name: params['name'],
                          cooldown: params['cooldown'],
                          in_game_effect: params['in_game_effect'],
                          flavor_text: params['flavor_text'])
  end

end
