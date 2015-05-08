require 'rails_helper'

describe 'Thing::Create' do
  it 'exists' do
    expect{ Thing::Create }.to_not raise_error
  end

  it 'persists' do
    params = { thing: { name: 'Rails', description: 'Some description' } }
    thing = Thing::Create[params].model

    expect(thing.persisted?).to be true
    expect(thing.name).to eq('Rails')
    expect(thing.description).to eq('Some description')
  end
end
