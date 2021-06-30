class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validates :is_title_clickbait?

    def is_title_clickbait? 
        words = ["Won't Believe", "Secret", /TOP [0-9]/i, "Guess"]
        unless words.none? {|word| word.match :title}
            errors.add(:title, "Is not clickbaity")
        end
    end
end
