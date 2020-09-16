class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, acceptance: { accept: ['Fiction', 'Non-Fiction'] }
  validate :non_clickbait?

  @@clickbait = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def non_clickbait?
    if @@clickbait.none? { |e| e.match title }
      errors.add(:title, "post title must include clickbait")
    end
  end
end
