class MyValidator < ActiveModel::Validator
    def validate(record)
      if record.title
        rec = ["Won't Believe", "Secret", "Top[number]", "Guess"]
        if rec.detect {|el| record.title.include?(el) }.nil?
          record.errors[:title] << "Must contain clickbait"
        end
      end
    end
  end 