require 'test_helper'

class AdministrativeDivisionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:administrative_divisions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_administrative_division
    assert_difference('AdministrativeDivision.count') do
      post :create, :administrative_division => { }
    end

    assert_redirected_to administrative_division_path(assigns(:administrative_division))
  end

  def test_should_show_administrative_division
    get :show, :id => administrative_divisions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => administrative_divisions(:one).id
    assert_response :success
  end

  def test_should_update_administrative_division
    put :update, :id => administrative_divisions(:one).id, :administrative_division => { }
    assert_redirected_to administrative_division_path(assigns(:administrative_division))
  end

  def test_should_destroy_administrative_division
    assert_difference('AdministrativeDivision.count', -1) do
      delete :destroy, :id => administrative_divisions(:one).id
    end

    assert_redirected_to administrative_divisions_path
  end
end
