require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
#  test "the truth" do
#    assert true
#  end


test "should not save user without username and password" do
  user = User.new
  assert !user.save
end

end
