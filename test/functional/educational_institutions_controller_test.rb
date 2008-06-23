require 'test_helper'

class EducationalInstitutionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_institutions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_educational_institution
    assert_difference('EducationalInstitution.count') do
      post :create, :educational_institution => { }
    end

    assert_redirected_to educational_institution_path(assigns(:educational_institution))
  end

  def test_should_show_educational_institution
    get :show, :id => educational_institutions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => educational_institutions(:one).id
    assert_response :success
  end

  def test_should_update_educational_institution
    put :update, :id => educational_institutions(:one).id, :educational_institution => { }
    assert_redirected_to educational_institution_path(assigns(:educational_institution))
  end

  def test_should_destroy_educational_institution
    assert_difference('EducationalInstitution.count', -1) do
      delete :destroy, :id => educational_institutions(:one).id
    end

    assert_redirected_to educational_institutions_path
  end
end
