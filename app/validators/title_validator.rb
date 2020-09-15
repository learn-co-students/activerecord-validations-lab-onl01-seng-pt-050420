class TitleValidator < ActiveModel::Validator
    CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]
    def validate(record)
        unless record.title.include?(CLICKBAIT[0]) || record.title.include?(CLICKBAIT[1]) || record.title.include?(CLICKBAIT[2]) || record.title.include?(CLICKBAIT[3])
            record.errors[:title] << "Not Clickbait-y Enough!"
        end
    end
end