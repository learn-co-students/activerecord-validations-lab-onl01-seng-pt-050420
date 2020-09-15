class PostValidator < ActiveModel::Validator
    def validate(record)
        if record.title && !record.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
            record.errors[:title] << "This might not be clickbait-y!"
        end
    end  
end