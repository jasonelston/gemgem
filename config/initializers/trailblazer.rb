require 'trailblazer/autoloading'

# Required to eliminate to avoid a undefined method 'reforms_path' error
# for now. This will be done automatically soon.
Trailblazer::Operation::CRUD.module_eval do
  module Included
    def included(base)
      super # the original CRUD::included method.
      base.send :include, Trailblazer::Operation::CRUD::ActiveModel
    end
  end
  extend Included # override CRUD::included.
end
