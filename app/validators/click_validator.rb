class ClickValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            contains = ["Won't Believe", "Secret", "Top", "Guess"]
            result = contains.any? { |word| record.title.include? word }
            unless result == true
                record.errors[:title] << 'Must have click-bait-y title'
            end
        end
    end
end