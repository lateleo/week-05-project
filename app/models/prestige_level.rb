class PrestigeLevel < ActiveRecord::Base
  # Joiner class between Characters and Prestige Classes so that characters
  # can have a different level in each Class (Base and Prestige) they belong to.
  validates :character_id, presence: true
  validates :prestige_class_id, presence: true
  validates :levels, numericality: {greater_than: 0, message: "must be 1 or greater."}

  belongs_to :prestige_class
  belongs_to :character

end
