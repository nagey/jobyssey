require 'test_helper'

class GeoPositionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:geo_positions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_geo_position
    assert_difference('GeoPosition.count') do
      post :create, :geo_position => { }
    end

    assert_redirected_to geo_position_path(assigns(:geo_position))
  end

  def test_should_show_geo_position
    get :show, :id => geo_positions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => geo_positions(:one).id
    assert_response :success
  end

  def test_should_update_geo_position
    put :update, :id => geo_positions(:one).id, :geo_position => { }
    assert_redirected_to geo_position_path(assigns(:geo_position))
  end

  def test_should_destroy_geo_position
    assert_difference('GeoPosition.count', -1) do
      delete :destroy, :id => geo_positions(:one).id
    end

    assert_redirected_to geo_positions_path
  end
end
