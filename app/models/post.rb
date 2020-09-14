class Post < ActiveRecord::Base
    CATEGORIES = ["Fiction", "Non-Fiction"]
    ACCEPTABLE_TITLES = [/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]
    validates :title, presence: true 
    validate :is_clickbait?
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def is_clickbait?
        if ACCEPTABLE_TITLES.none? { |pat| pat.match title }
            errors.add(:title, "isn't interesting enough. Be sure to use titles that readers 'can't believe', can't 'guess', or tells them a 'top' list or a 'secret'.")
        end
    end 
end
