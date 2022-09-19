class ContactMessage < ApplicationRecord
    validates :message, presence: true
end
