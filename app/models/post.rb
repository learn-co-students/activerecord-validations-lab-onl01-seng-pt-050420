class Post < ActiveRecord::Base
    include ActiveModel::Validations
    
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
    validates_with IsClickbateValidator, on: :create
    


    # def is_sufficiently_click_batey
    #     if !self.title.include?("Won't Believe", "Secret", "Top [number]", "Guess" )
    #         errors.add(:title, "Please make it more click bate")
    #     end 
    # end 
end
