require_relative "../test_helper.rb"

class RacialAbilityTest < MiniTest::Test

  def test_racial_ability_can_be_created_normally
    racial_ability = RacialAbility.new(name: "Every Man For Himself")
    refute_nil(racial_ability)
  end

end
