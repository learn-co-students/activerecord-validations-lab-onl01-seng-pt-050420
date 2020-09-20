class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        clickbaits = [/Won't Believe/i, /Secret/i, /Top [\d]*/i, /Guess/i]
        if title.present? && clickbaits.none? {|clickbait| clickbait.match(title)}
            errors.add(:title, "needs to be clickbait")
        end
    end

end
