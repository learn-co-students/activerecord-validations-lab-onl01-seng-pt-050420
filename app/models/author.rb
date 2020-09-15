class Author < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with AuthorValidator
    validates :name, presence: true, uniqueness: true
    validates :phone_number, presence: true, length: { is: 10 }
end
