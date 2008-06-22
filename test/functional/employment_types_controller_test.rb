require 'test_helper'

class EmploymentTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:employment_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_employment_type
    assert_difference('EmploymentType.count') do
      post :create, :employment_type => { }
    end

    assert_redirected_to employment_type_path(assigns(:employment_type))
  end

  def test_should_show_employment_type
    get :show, :id => employment_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => employment_types(:one).id
    assert_response :success
  end

  def test_should_update_employment_type
    put :update, :id => employment_types(:one).id, :employment_type => { }
    assert_redirected_to employment_type_path(assigns(:employment_type))
  end

  def test_should_destroy_employment_type
    assert_difference('EmploymentType.count', -1) do
      delete :destroy, :id => employment_types(:one).id
    end

    assert_redirected_to employment_types_path
  end
end
