require_relative '../test_helper'

class RoleValidationsTest < ActiveSupport::TestCase
  def setup
    @role = Role.new
  end

  test 'a role is valid with a name' do
    assert_invalid_key @role, :name, nil
    assert_invalid_key @role, :name, ' '
    assert_valid_key @role, :name, 'Collector'
  end

  test 'a role is valid with a definition' do
    assert_invalid_key @role, :definition, nil
    assert_invalid_key @role, :definition, ' '
    assert_valid_key @role, :definition, 'A person that collects art.'
  end
end
