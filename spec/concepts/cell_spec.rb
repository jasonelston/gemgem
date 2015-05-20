require 'rails_helper'

describe 'Home', type: :feature do

  # def document_root_element
  #   html_document.root
  # end
  #
  it 'does something' do
    Thing::Create[thing: { name: 'Trailblazer' }]
    Thing::Create[thing: { name: 'Rails' }]

    visit '/'

    expect(page).to have_selector('.columns .header a', text: 'Rails')
    expect(page).to have_selector('.columns.end .header a', 1)
    expect(page).to have_selector('.columns.end .header a', text: 'Trailblazer')
  end
end

describe 'Thing::Cell', type: :feature do
  let(:rails) { Thing::Create[thing: { name: 'Rails' }] }
  let(:trb) { Thing::Create[thing: { name: 'Trailblazer' }] }

  subject { concept("thing/cell", collection: [trb, rails], last: rails) }
  # subject { Thing::Cell.new(Thing.last).show }

  it do
    expect(subject).to have_selector('.columns .header a', text: 'Rails')
    expect(subject).to have_selector('.columns.end .header a', 1)
    expect(subject).to have_selector('.columns.end .header a', text: 'Trailblazer')
  end
end
