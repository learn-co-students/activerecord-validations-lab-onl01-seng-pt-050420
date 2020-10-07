class TitleValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            reqs = ["Won't Believe", "Secret", "Top [number]", "Guess"]
            if reqs.detect {|ele| record.title.include?(ele)}.nil?
            record.errors[:title] << "Must contain clickbait"
            end

        end

    end
end
 