class ThingsController < ApplicationController
  ##
  def new
    @form = ThingForm.new(Thing.new)
  end
end
