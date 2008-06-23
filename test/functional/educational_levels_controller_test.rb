require 'test_helper'

class EducationalLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_educational_level
    assert_difference('EducationalLevel.count') do
      post :create, :educational_level => { }
    end

    assert_redirected_to educational_level_path(assigns(:educational_level))
  end

  def test_should_show_educational_level
    get :show, :id => educational_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => educational_levels(:one).id
    assert_response :success
  end

  def test_should_update_educational_level
    put :update, :id => educational_levels(:one).id, :educational_level => { }
    assert_redirected_to educational_level_path(assigns(:educational_level))
  end

  def test_should_destroy_educational_level
    assert_difference('EducationalLevel.count', -1) do
      delete :destroy, :id => educational_levels(:one).id
    end

    assert_redirected_to educational_levels_path
  end
end
