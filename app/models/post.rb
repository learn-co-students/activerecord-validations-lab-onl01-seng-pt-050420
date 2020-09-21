class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 100}
    validates :category, inclusion: {in: %w(Fiction)}
    validate :click_bait
    

    def click_bait
        if title.present? && !["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|t| title.include? t}
            errors.add(:title, "Not Click Bait")
        end
    end
end