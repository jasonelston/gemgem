require 'test_helper'

##
class ThingCellTest < Cell::TestCase
  controller ThingsController

  let(:rails) { Thing::Create[thing: { name: 'Rails' }] }
  let(:trb) { Thing::Create[thing: { name: 'Trailblazer' }] }

  it do
    cell_response = concept('thing/cell', collection: [trb, rails], last: rails)
    # html = concept('thing/cell', rails.model).(:show)
    html = Capybara.string(cell_response)

    html.must_have_selector '.columns .header a', text: 'Rails'
    html.must_have_selector '.columns .header a', text: 'Trailblazer'
  end
end
