class Message < ApplicationRecord
  belongs_to :user, required: true
end
