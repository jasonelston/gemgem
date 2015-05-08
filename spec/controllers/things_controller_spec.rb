require 'rails_helper'

RSpec.describe ThingsController, type: :controller do
  render_views

  describe '#new' do
    it do
      get :new
      expect(response).to render_template('new')
      assert_select('form #thing_name')
      assert_select('form #thing_name.readonly', false)
    end
  end

  describe '#create' do
    it do # valid
      post :create, thing: { name: 'Some thing' }
      expect(response).to redirect_to thing_path(Thing.last)
    end

    it do # invalid
      post :create, thing: { name: '' }
      expect(response).to render_template('new')
      assert_select('.error')
    end
  end

  describe '#edit' do
    it do # valid
      thing = Thing::Create[thing: { name: 'Some thing' }].model
      get :edit, id: thing.id
      assert_select("form #thing_name.readonly")
    end
  end
end
