class Ability < ActiveRecord::Base
  # Non-relational Attributes: name (string)
                              # damage_type (string)
                              # base_damage (integer)
                              # interval (string)
                              # range (integer)
                              # effect_shape (string)
                              # effect_size (integer, set to 0 if effect_shape is "point")
                              # description (text)
  # Has and belongs to many characters, base_classes, and prestige_classes
  validates :name, presence: {message: "cannot be blank."}
  validates :damage_type, presence: {message: "cannot be blank."}
  validates :base_damage, presence: {message: "cannot be blank."},
    numericality: {greater_than: 0, message: "must be positive."}
  validates :interval, format: {with: /\A(\d+d([234568]|1[02]|20))?\Z/}
  validates :range, presence: {message: "cannot be blank."},
    numericality: {greater_than_or_equal_to: 0, message: "must be positive or zero."}
  validates :effect_shape, presence: {message: "cannot be blank."}
  validates :effect_size, presence: {message: "cannot be blank."},
    numericality: {greater_than_or_equal_to: 0, message: "must be positive or zero."}
  validates :description, presence: {message: "cannot be blank."}

  has_and_belongs_to_many :characters
  has_and_belongs_to_many :base_classes
  has_and_belongs_to_many :prestige_classes

end
