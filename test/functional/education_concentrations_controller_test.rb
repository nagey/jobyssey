require 'test_helper'

class EducationConcentrationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:education_concentrations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_education_concentration
    assert_difference('EducationConcentration.count') do
      post :create, :education_concentration => { }
    end

    assert_redirected_to education_concentration_path(assigns(:education_concentration))
  end

  def test_should_show_education_concentration
    get :show, :id => education_concentrations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => education_concentrations(:one).id
    assert_response :success
  end

  def test_should_update_education_concentration
    put :update, :id => education_concentrations(:one).id, :education_concentration => { }
    assert_redirected_to education_concentration_path(assigns(:education_concentration))
  end

  def test_should_destroy_education_concentration
    assert_difference('EducationConcentration.count', -1) do
      delete :destroy, :id => education_concentrations(:one).id
    end

    assert_redirected_to education_concentrations_path
  end
end
