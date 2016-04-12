require_relative "../test_helper.rb"

class BaseClassTest < MiniTest::Test

  def test_base_class_can_be_created_normally
    base_class = BaseClass.new(name: "Paladin")
    refute_nil(base_class)
  end

end
