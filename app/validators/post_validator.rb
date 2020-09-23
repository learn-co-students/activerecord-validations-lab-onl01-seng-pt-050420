class PostValidator < ActiveModel::Validator
    def validate(record)
            if record.title
                words = ["Won't Believe", "Secret", "Top[number]", "Guess"]
                if words.detect{|el| record.title.include?(el) }.nil?
                record.errors[:title] << "Must contain clickbait"
            end
         end
      end
end