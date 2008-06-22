require 'test_helper'

class WorkingTimesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:working_times)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_working_time
    assert_difference('WorkingTime.count') do
      post :create, :working_time => { }
    end

    assert_redirected_to working_time_path(assigns(:working_time))
  end

  def test_should_show_working_time
    get :show, :id => working_times(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => working_times(:one).id
    assert_response :success
  end

  def test_should_update_working_time
    put :update, :id => working_times(:one).id, :working_time => { }
    assert_redirected_to working_time_path(assigns(:working_time))
  end

  def test_should_destroy_working_time
    assert_difference('WorkingTime.count', -1) do
      delete :destroy, :id => working_times(:one).id
    end

    assert_redirected_to working_times_path
  end
end
