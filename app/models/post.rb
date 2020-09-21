class ClickbaitValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /(Won't Believe|Secret|Top|Guess)/
        record.errors[attribute] << (options[:message] || "is not a clickbait")
      end
    end
  end

class Post < ActiveRecord::Base
    validates :title, presence: true, clickbait: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non_Fiction)}
end
