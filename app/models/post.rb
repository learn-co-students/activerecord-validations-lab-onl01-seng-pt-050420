class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with PostValidator
    validates :title, presence: true, uniqueness: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-fiction"] }

end
