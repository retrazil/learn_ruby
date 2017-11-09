#write your code here

def echo something
  something
end

def shout something
  something.upcase
end

# rest works the same way it works in clojure
# it is a variable length list/array
def repeat something, *rest
  if rest.length == 0
    return something + " " + something

  elsif not rest[0].to_i == 0
    number = rest[0].to_i
    repetitions = ""
    number.times do 
      repetitions += something + " "
    end
  end
  repetitions.chop  # remove last space 
  # something  + " " + something 
end

# chars converts string to array
# take takes characters of specified length 
# join rejoins the array to a string
def start_of_word word, length
  word.chars.take(length).join
end

def first_word word
  word.split(" ")[0]
end

# convert a line into title case
# except words like a, and the unless 
# they appear at the beginning
# "the bridges over the river kwai" => "The Bridges over the River Kwai" 
def titleize line
  
  separate_words = line.split
  
  # if there is only one word in the title
  # return title cased word 
  if separate_words.count == 1
    return separate_words[0][0].upcase + separate_words[0].chars.drop(1).join
  end
  
  # for more than one word
  # convert first word into title case
  # irrespective of what the word is e.g., the, and over 
  first_word = separate_words[0]
  separate_words[0].replace(first_word[0].upcase + first_word.chars.drop(1).join) 

  separate_words.each do |word|
    if word != "and" and word != "the" and word != "over" # do not title case these words 
      word.replace(word[0].upcase + word[1..word.size])
      end 
    end
  separate_words.join(" ")
end


puts
