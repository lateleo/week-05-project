require_relative "../test_helper.rb"

class AbilityTest < MiniTest::Test

  def test_ability_can_be_created_normally
    ability = Ability.new(name: "Fireball")
    refute_nil(ability)
  end

end
