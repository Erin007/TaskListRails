require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "User with minimal information is valid" do
    users(:minimal_valid_user).valid?
    assert users(:minimal_valid_user).valid?
    #Check Ron and Harry's validiity too, because I will use them in the controller tests
    users(:valid_user_harry).valid?
    assert users(:valid_user_harry).valid?
    users(:valid_user_ron).valid?
    assert users(:valid_user_ron).valid?
  end

  test "The user must have a valid email" do
    users(:no_email_user).invalid?
    assert users(:no_email_user).invalid?
    users(:invalid_email_user).invalid?
    assert users(:invalid_email_user).invalid?
  end

  test "The user must have a provider" do
    users(:no_provider_user).invalid?
    assert users(:no_provider_user).invalid?
  end

end
