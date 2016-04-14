class UniversalValidator < ActiveModel::Validator

  def message(model, record)
    if record.name
      "There is already a#{"n" if model.to_s =~ /\A[AEIOU]/}
      #{model.gsub(/(?<=\p{L})(\p{Lu})/, " #{$1}")} with the name '#{record.name}'."
    else
      "Name cannot be blank."
  end

  def validate(record)
    [Ability, BaseClass, Character, PrestigeClass, Race, RacialAbility].each do |m|
      (record.errors[:name] << message(m, record)) if (m.find_by(name: record.name) || !record.name)
    end
  end

end
