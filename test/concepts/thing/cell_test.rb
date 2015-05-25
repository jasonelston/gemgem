require 'test_helper'

##
class ThingCellTest < Cell::TestCase
  controller ThingsController

  let(:rails) { Thing::Create[thing: { name: 'Rails' }].model }
  let(:trb) { Thing::Create[thing: { name: 'Trailblazer' }].model }

  it do
    html = concept("thing/cell", collection: [rails, trb], last: trb)

    html.must_have_selector '.columns .header a', text: 'Rails'
    html.wont_have_selector '.columns.end .header a', text: 'Rails'
    html.must_have_selector '.columns.end .header a', text: 'Trailblazer'
  end

  it do
    Thing::Create[thing: { name: 'Trailblazer' }]
    Thing::Create[thing: { name: 'Rails' }]

    html = concept('thing/cell/grid')
    # html = Capybara.string(cell_response)

    html.must_have_selector '.columns .header a', text: 'Rails'
    html.wont_have_selector '.columns.end .header a', text: 'Rails'
    html.must_have_selector '.columns.end .header a', text: 'Trailblazer'
  end
end
