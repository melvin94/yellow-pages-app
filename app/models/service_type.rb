class ServiceType < ApplicationRecord
    has_many :service_organizations, dependent: :destroy
end
