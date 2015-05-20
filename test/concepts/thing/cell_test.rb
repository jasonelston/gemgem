require 'test_helper'

##
class ThingCellTest < Cell::TestCase
  let(:rails) { Thing::Create[thing: { name: 'Rails' }] }
  let(:trb) { Thing::Create[thing: { name: 'Trailblazer' }] }

  # subject { concept('thing/cell', collection: [trb, rails], last: rails) }
  subject { concept('thing/cell', rails) }

  it do
    subject.must_have_selector '.columns .header a', text: 'Rails'
  end
end
