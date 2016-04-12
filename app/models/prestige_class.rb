class PrestigeClass < ActiveRecord::Base
  # Non-relational Attributes: name (string),
                              # range (string),
                              # role (string),
                              # armor_type (string)
                              # primary_stat (string),
                              # seconardy_stat (string),
                              # entry_requirements (text),
                              # flavor_text (text, optional)
  # Has many abilities and characters
  validates :name, presence: {message: "cannot be blank."}
  validates :range, presence: {message: "cannot be blank."}
  validates :role, presence: {message: "cannot be blank."}
  validates :armor_type, presence: {message: "cannot be blank."}
  validates :primary_stat, presence: {message: "cannot be blank."}
  validates :seconardy_stat, presence: {message: "cannot be blank."}

  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :characters

end
