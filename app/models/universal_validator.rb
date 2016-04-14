class UniversalValidator < ActiveModel::Validator

  def message(models, record)
    if !record.name
      "Name cannot be blank."
    else
      "There is already a#{"n" if model.to_s =~ /\A[AEIOU]/}
      #{models.first.gsub(/(?<=\p{L})(\p{Lu})/, " #{$1}")} with the name '#{record.name}'."
    end
  end

  def validate(record)
    models = [Ability, BaseClass, Character, PrestigeClass, Race, RacialAbility]
    models.select!{|m| m.where(name: record.name).any?{|obj| obj != record}}
    record.errors[:name].add(message(models, record)) if (models.any? == record.name?)
  end

end
