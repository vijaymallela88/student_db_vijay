class Institution < ApplicationRecord
    has_many :students, dependent: :destroy
    validates_presence_of :name, :address, :phone
end
