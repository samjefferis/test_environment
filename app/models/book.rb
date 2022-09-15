class Book < ApplicationRecord
    validates :title, :author, :price, :published, presence: true
    validates :price, numericality: true
    validates :published, format: { with: /\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/, message: "year-month-day" }
end
