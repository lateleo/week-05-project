class RacialAbility < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                              # cooldown (string),
                              # in_game_effect (text),
                              # flavor_text (text, optional)
  # Has many characters
  # Has one race, and an ability_id, which is unique for a given :race_id
  validates :name, presence: {message: "cannot be blank."},
    uniqueness: {scope: :race_id, message: "must be unique."}
  validates :cooldown, presence: {message: "cannot be blank."}
  validates :in_game_effect, presence: {message: "cannot be blank."}
  validates :race_id, presence: {message: "cannot be blank."}
  before_validation :set_ability_id

  has_many :characters
  belongs_to :race

  def set_ability_id
    count = 0
    count += 1 while RacialAbility.find_by(ability_id: count, race_id: race_id)
    ability_id = count if ability_id == nil
  end
end
