require_relative '../test_helper'

class CadresControllerTest < ActionController::TestCase
  def setup
    @cadre = cadres(:mobile_engineering)
  end

  test 'shows a list of cadres' do
    get 'index'
    assert_response :ok
    assert_template 'index'
  end

  test 'shows a new cadre page' do
    get 'new'
    assert_response :ok
    assert_template 'new'
  end

  test 'creates a cadre' do
    assert_difference 'Cadre.count', +1 do
      post 'create', cadre: valid_cadre_params
    end
    assert_response :found
  end

  test 'shows a cadre' do
    get 'show', id: @cadre.to_param
    assert_response :ok
    assert_template 'show'
  end

  test 'edit a cadre' do
    get 'edit', id: @cadre.to_param
    assert_response :ok
    assert_template 'edit'
  end

  test 'updates the name of a cadre' do
    put :update, id: @cadre.to_param, cadre: { name: 'new name' }
    assert @cadre.reload.name == 'new name'
    assert_redirected_to cadres_url
  end

  # children

  private

  def valid_cadre_params
    { name: 'engineering', definition: 'very precisely defined' }
  end
end
