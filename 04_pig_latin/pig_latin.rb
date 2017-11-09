# coding: utf-8
# translate a word into pig latin
# ===============================
# For words that begin with consonant sounds, 
# all letters before the initial vowel are placed 
# at the end of the word sequence. 
# Then, "ay" is added, as in the following examples:
#    "pig" = "igpay"
#    "latin" = "atinlay"
# ---------------------------
# For words that begin with vowel sounds, one just adds "ay" to the end. Examples are:# 
#    "eat" = "eatay"
#    "omelet" = "omeletay"
# source: https://en.wikipedia.org/wiki/Pig_Latin
def translate_word word 
  
  vowels = ["a", "e", "i", "o", "u"]

  # for vowels
  if vowels.include?(word[0])
    return word + "ay"
    
  # for consonants
  else
    return_word = ""
    word.chars.each do |char| 
      if vowels.include?(char)
        # treat "qu" as a single character
        # because "q" is always succeeded by "u"
        # 例外 exception
        if return_word.chars.last == "q"
          return word.chars.drop(return_word.size + 1).join + return_word + "uay"
         end

        # if no "qu" found, 普通 normal case 
        return word.chars.drop(return_word.size).join + return_word + "ay"
      end  
      return_word += char
    end
  end
end 

# translate an entire line  
def translate line
  pig_latined = []

  # translate word by word 
  line.split.each do |word|
    pig_latined.push(translate_word word)
  end

  # add spaces between words 
  pig_latined.join(" ")
end

