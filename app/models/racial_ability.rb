class RacialAbility < ActiveRecord::Base
  # Non-relational Attributes: name (string), description (text)
  # Has many characters
  # Has one race
  validates :name, presence: {message: "cannot be blank."}
  validates :description, presence: {message: "cannot be blank."}

  has_many :characters
  belongs_to :race
end
