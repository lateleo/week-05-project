class UniversalValidator < ActiveModel::Validator

  def validate(record)
    models = [Ability, BaseClass, Character, PrestigeClass, Race, RacialAbility]
    models.select!{|m| m.where(name: record.name).any?{|obj| obj != record}}
    if models.any?
      record.errors[:name].add("There is already a#{"n" if model.to_s =~ /\A[AEIOU]/}
      #{models.first.gsub(/(?<=\p{L})(\p{Lu})/, " #{$1}")} with the name '#{record.name}'.")
    else
      record.errors[:name].add("Name cannot be blank.") if !record.name
    end
  end
end
