class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title && record.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            record.errors.add :title, "Must contain clickbait!"
        end
    end
end