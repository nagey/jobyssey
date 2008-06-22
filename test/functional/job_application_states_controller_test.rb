require 'test_helper'

class JobApplicationStatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_application_states)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_application_state
    assert_difference('JobApplicationState.count') do
      post :create, :job_application_state => { }
    end

    assert_redirected_to job_application_state_path(assigns(:job_application_state))
  end

  def test_should_show_job_application_state
    get :show, :id => job_application_states(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_application_states(:one).id
    assert_response :success
  end

  def test_should_update_job_application_state
    put :update, :id => job_application_states(:one).id, :job_application_state => { }
    assert_redirected_to job_application_state_path(assigns(:job_application_state))
  end

  def test_should_destroy_job_application_state
    assert_difference('JobApplicationState.count', -1) do
      delete :destroy, :id => job_application_states(:one).id
    end

    assert_redirected_to job_application_states_path
  end
end
