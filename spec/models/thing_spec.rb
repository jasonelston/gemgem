require 'rails_helper'

RSpec.describe Thing, type: :model do
  it 'should exist' do
    expect{ Thing }.to_not raise_error
  end
end
