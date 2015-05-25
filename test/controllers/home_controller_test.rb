require 'test_helper'

class IntegrationTest < ActionDispatch::IntegrationTest
  it do
    Thing::Create[thing: { name: 'Rails' }]

    get '/'

    assert_select '.header a', 'Rails'
  end
end
