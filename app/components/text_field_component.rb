# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form: nil, method: nil, name: nil, value: nil)
    @form = form
    @method = method
    @name = name
    @value = value
  end
end
