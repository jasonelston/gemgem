require 'test_helper'

class IntegrationTest < ActionDispatch::IntegrationTest
  it do
    Thing::Create[thing: { name: 'Trailblazer' }]
    Thing::Create[thing: { name: 'Rails' }]

    get '/'

    assert_select '.columns .header a', 'Rails'
    assert_select '.columns.end .header a', 1
    assert_select '.columns.end .header a', 'Trailblazer'
  end
end
