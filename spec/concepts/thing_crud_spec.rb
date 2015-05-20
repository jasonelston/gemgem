describe 'Thing::Create' do
  it 'exists' do
    expect{ Thing::Create }.to_not raise_error
  end

  it 'persists' do
    params = { thing: { name: 'Rails', description: 'Some description' } }
    thing = Thing::Create[params].model

    expect(thing.persisted?).to be true
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Some description'
  end

  it 'requires name' do
    result, op = Thing::Create.run(thing: { name: '' })

    expect(result).to eq false
    expect(op.model.persisted?).to eq false
    expect(op.contract.errors.to_s).to include("can't be blank")
  end

  it 'requires minimum desc length of 4' do
    result, op = Thing::Create.run(thing: { name: 'OK', description: 'NOK' })

    expect(result).to eq false
    expect(op.model.persisted?).to eq false
    expect(op.contract.errors.to_s).to include('minimum is 4')
  end
end

describe 'Thing::Update' do
  let(:thing) { Thing::Create[thing: { name: 'Some thing' }].model }

  it 'persists valid, ignores name' do
    Thing::Update[
      id: thing.id,
      thing: {
        name: 'Some thing else',
        description: 'A description'
      }
    ]

    thing.reload
    expect(thing.name).to eq('Some thing') # not changed
    expect(thing.description).to eq('A description') # changed
  end
end
