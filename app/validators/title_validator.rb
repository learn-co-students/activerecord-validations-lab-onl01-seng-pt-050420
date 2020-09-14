class TitleValidator < ActiveModel::Validator 

  def validate(record)
    if record.title 
      clickbait_titles = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      if clickbait_titles.detect { |clickbait| record.title.include?(clickbait) }.nil?
        record.errors[:title] << "Title must be clickbait-y."
      end
    end
  end

end