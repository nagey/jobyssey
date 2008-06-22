require 'test_helper'

class JobApplicationStatusTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_application_status_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_application_status_type
    assert_difference('JobApplicationStatusType.count') do
      post :create, :job_application_status_type => { }
    end

    assert_redirected_to job_application_status_type_path(assigns(:job_application_status_type))
  end

  def test_should_show_job_application_status_type
    get :show, :id => job_application_status_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_application_status_types(:one).id
    assert_response :success
  end

  def test_should_update_job_application_status_type
    put :update, :id => job_application_status_types(:one).id, :job_application_status_type => { }
    assert_redirected_to job_application_status_type_path(assigns(:job_application_status_type))
  end

  def test_should_destroy_job_application_status_type
    assert_difference('JobApplicationStatusType.count', -1) do
      delete :destroy, :id => job_application_status_types(:one).id
    end

    assert_redirected_to job_application_status_types_path
  end
end
