require_relative "../test_helper.rb"

class CharacterTest < MiniTest::Test

  def test_character_can_be_created_normally
    character = Character.new
    refute_nil(character)
  end

end
