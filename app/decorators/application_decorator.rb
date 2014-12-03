class ApplicationDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%d/%m/%Y")
    end
  end

  def updated_at
    helpers.content_tag :span, class: 'time' do
      object.updated_at.strftime("%d/%m/%Y")
    end
  end

end
