class RacialAbility < ActiveRecord::Base
  # Non-relational Attributes: name (string, unique to each race),
                              # cooldown (string),
                              # in_game_effect (text),
                              # flavor_text (text, optional)
  # Has many characters
  # Has one race, and a url_name, which is derived from the name
  validates_with UniversalValidator
  validates :cooldown, presence: {message: "cannot be blank."}
  validates :in_game_effect, presence: {message: "cannot be blank."}
  validates :race_id, presence: {message: "cannot be blank."}
  before_validation :set_url_name

  has_many :characters
  belongs_to :race

  def set_url_name
    self.url_name = name.downcase.gsub(" ","_")
  end

  def update_with(params)
    self.update_attributes(name: params['name'],
                          cooldown: params['cooldown'],
                          in_game_effect: params['in_game_effect'],
                          flavor_text: params['flavor_text'])
  end

end
