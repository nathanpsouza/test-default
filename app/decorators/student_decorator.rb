class StudentDecorator < ApplicationDecorator
  delegate_all

  def documents
    "#{object.rg}/#{object.cpf}"
  end

  def phone_number
    "#{object.ddd} #{object.phone}"
  end

  def address
    address_data = [object.street, object.number, object.district, object.city, object.state]
    address_data.reject! { |c| c.empty? }
    address_data.join ", "
  end

end
