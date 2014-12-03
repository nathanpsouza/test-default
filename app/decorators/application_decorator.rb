class ApplicationDecorator < Draper::Decorator
  delegate_all

  FORMAT = "%d/%m/%Y %H:%M:%S"

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime(FORMAT)
    end
  end

  def updated_at
    helpers.content_tag :span, class: 'time' do
      object.updated_at.strftime(FORMAT)
    end
  end

end
