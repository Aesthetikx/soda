class Company < ApplicationRecord
  def create_schema!
    Apartment::Tenant.create(subdomain)
  end

  def activate!
    Apartment::Tenant.switch!(subdomain)
  end
end
