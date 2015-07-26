require_relative '../test_helper'

class WriterValidationsTest < ActiveSupport::TestCase
  def setup
    @writer = Writer.new
  end

  test 'a writer is valid with an associated cadre' do
    assert_invalid_key @writer, :cadre_id, nil
    assert_valid_key @writer, :cadre_id, cadres(:collector_relations).id
  end

  test 'a writer is valid with a name' do
    assert_invalid_key @writer, :name, nil
    assert_invalid_key @writer, :name, ' '
    assert_valid_key @writer, :name, 'access to my collection'
  end
end
