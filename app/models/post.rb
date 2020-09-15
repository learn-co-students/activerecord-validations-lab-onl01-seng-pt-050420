class Post < ActiveRecord::Base 
    include ActiveModel::Validations
    validates :title, presence: true  
    validates :content, length: { minimum: 250 } # Post content is at least 250 characters long
    validates :summary, length: { maximum: 250 } # Post summary is a maximum of 250 characters 
    validates :category, inclusion: { in: %w( Fiction Non-Fiction ) } #, message: "%{value} is not a valid size" } 
    validates_with ClickbaitValidator

end
