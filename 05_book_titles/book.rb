class Book
  attr_accessor :title 

  def title
    titlecase
  end

 # private
  # turn a word into titlecase 
  # unless it's one of the exceptions.
  # If it's a first word, turn into 
  # title case irrespective of whether it's 
  # an exception or not 
  def titleize_word word, first_word=false 
    exceptions = ["the", "and", "in", "an", "over", "of", "a"]  

    if exceptions.include? word and first_word == false 
      word
    else
      word[0].upcase  + word.chars.drop(1).join 
    end 
  end

  # convert title into titlecase
  # e.g. the bridges over the river kwai => The Bridges over the River Kwai
  def titlecase
    title_case = []
    # titleize first word in title separately 
    #(might contain exception words)
    title_case.push titleize_word @title.split[0], true  

    @title.split.drop(1).each do |word|
      title_case.push titleize_word(word)
    end  

    title_case.join(" ")
  end
end

book = Book.new
book.title = "little stuart"

puts book.titlecase 
