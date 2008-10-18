require 'test_helper'

class EmployerProfilesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_profiles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_employer_profile
    assert_difference('EmployerProfile.count') do
      post :create, :employer_profile => { }
    end

    assert_redirected_to employer_profile_path(assigns(:employer_profile))
  end

  def test_should_show_employer_profile
    get :show, :id => employer_profiles(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => employer_profiles(:one).id
    assert_response :success
  end

  def test_should_update_employer_profile
    put :update, :id => employer_profiles(:one).id, :employer_profile => { }
    assert_redirected_to employer_profile_path(assigns(:employer_profile))
  end

  def test_should_destroy_employer_profile
    assert_difference('EmployerProfile.count', -1) do
      delete :destroy, :id => employer_profiles(:one).id
    end

    assert_redirected_to employer_profiles_path
  end
end
