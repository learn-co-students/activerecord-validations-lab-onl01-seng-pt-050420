class TitleValidator < ActiveModel::Validator

    def validate(record)
        ref = ["Won't Believe",
        "Secret", "Top [number]", "Guess"]
        unless record.title && !record.title.include?("Won't Believe" ||
            "Secret" || "Top [number]" || "Guess")
            record.errors[:title] << "Must contain clickbait"
        end
    end
end