require 'test_helper'

class PersonalQualitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_qualities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_personal_quality
    assert_difference('PersonalQuality.count') do
      post :create, :personal_quality => { }
    end

    assert_redirected_to personal_quality_path(assigns(:personal_quality))
  end

  def test_should_show_personal_quality
    get :show, :id => personal_qualities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => personal_qualities(:one).id
    assert_response :success
  end

  def test_should_update_personal_quality
    put :update, :id => personal_qualities(:one).id, :personal_quality => { }
    assert_redirected_to personal_quality_path(assigns(:personal_quality))
  end

  def test_should_destroy_personal_quality
    assert_difference('PersonalQuality.count', -1) do
      delete :destroy, :id => personal_qualities(:one).id
    end

    assert_redirected_to personal_qualities_path
  end
end
