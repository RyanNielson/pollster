# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  renders_one :leading

  def initialize(href: nil, type: nil, form: nil, full: false, scheme: :default, **other)
    @href = href
    @type = type
    @form = form
    @full = full
    @scheme = scheme
    @other = other
  end

  private

  def classes
    classes = "transition-all text-lg hover:translate-x-0.5 hover:translate-y-0.5 hover:shadow-opaque-1 active:translate-x-2 active:translate-y-2 active:shadow-none text-lg rounded-md border-4 border-black shadow-opaque-2 bg-blue-500 hover:bg-blue-700 text-white text-base font-bold py-2 px-4 #{@full && 'w-full'}"
    classes = "#{classes} bg-blue-500 hover:bg-blue-700" if @scheme == :default
    classes = "#{classes} bg-red-500 hover:bg-red-700" if @scheme == :danger
    classes = "#{classes} w-full" if @full
    classes = "#{classes} inline-flex items-center" if leading?
    classes
  end
end
