class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbaity?
  
  
  CUSTOM_VALIDATION = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i 
    ]
    
  def is_clickbaity?
    if CUSTOM_VALIDATION.none? { |valid| valid.match title }
      errors.add(:title, "must be clickbait")
    end
  end
    
end
