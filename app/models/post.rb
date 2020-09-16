class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, acceptance: { accept: ['Fiction', 'Non-Fiction'] }
  # validate :non_clickbait

  # def non_clickbait
  #   if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
  #     errors.add(:title, "not enough clickbait")
  #   end
  # end
end
