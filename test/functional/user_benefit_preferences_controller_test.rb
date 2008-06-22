require 'test_helper'

class UserBenefitPreferencesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_benefit_preferences)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_benefit_preferences
    assert_difference('UserBenefitPreferences.count') do
      post :create, :user_benefit_preferences => { }
    end

    assert_redirected_to user_benefit_preferences_path(assigns(:user_benefit_preferences))
  end

  def test_should_show_user_benefit_preferences
    get :show, :id => user_benefit_preferences(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => user_benefit_preferences(:one).id
    assert_response :success
  end

  def test_should_update_user_benefit_preferences
    put :update, :id => user_benefit_preferences(:one).id, :user_benefit_preferences => { }
    assert_redirected_to user_benefit_preferences_path(assigns(:user_benefit_preferences))
  end

  def test_should_destroy_user_benefit_preferences
    assert_difference('UserBenefitPreferences.count', -1) do
      delete :destroy, :id => user_benefit_preferences(:one).id
    end

    assert_redirected_to user_benefit_preferences_path
  end
end
