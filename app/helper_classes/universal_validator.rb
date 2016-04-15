class UniversalValidator < ActiveModel::Validator

  def validate(record)
    models = [Ability, BaseClass, Character, PrestigeClass, Race, RacialAbility]
    models.select!{|m| m.where(name: record.name).any?{|obj| obj != record}}
    if models.any?
      record.errors[:name] << "is already the name of a#{"n" if (models.first.to_s =~ /\A[AEIOU]/)}
      #{models.first.to_s.gsub(/(?<=\p{L})(\p{Lu})/, " #{$1}")}."
    else
      (record.errors[:name] << "cannot be blank.") if !record.name?
    end
  end
end
