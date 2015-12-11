require_relative '../test_helper'

class WriterValidationsTest < ActiveSupport::TestCase
  def setup
    @writer = Writer.create!(email: 'eloy@artsymail.com')
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

  test 'a writer is valid with an artsymail.com email address' do
    assert_invalid_key @writer, :email, nil
    assert_invalid_key @writer, :email, ' '
    assert_invalid_key @writer, :email, 'eloy@artsy.net'
    assert_valid_key @writer, :email, 'eloy@artsymail.com'
  end
end
