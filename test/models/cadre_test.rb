require_relative '../test_helper'

class CadreValidationsTest < ActiveSupport::TestCase
  def setup
    @cadre = Cadre.new
  end

  test 'a cadre is valid with a name' do
    assert_invalid_key @cadre, :name, nil
    assert_invalid_key @cadre, :name, ' '
    assert_valid_key @cadre, :name, 'Collector Relations'
  end

  test 'a cadre is valid with a definition' do
    assert_invalid_key @cadre, :definition, nil
    assert_invalid_key @cadre, :definition, ' '
    assert_valid_key @cadre, :definition, 'Deals with users that collect art.'
  end
end
