class Validators < ActiveModel::Validator
    def validate(record)
        if record.title
          name = ["Won't Believe", "Secret", "Top[number]", "Guess"]
            if name.detect {|i| record.title.include?(i) }.nil?
            record.errors[:title] << "Clickbait"
            end
        end
    end
end 