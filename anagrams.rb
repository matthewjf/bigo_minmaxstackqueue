require 'byebug'
def first_anagram?(str1, str2)
  str1.chars.permutation.map(&:join).include?(str2) #O(n!) super slow
end

def third_anagram?(str1, str2) # quicksort so n^2 (duh)
  str1_arr = str1.chars.sort
  str2_arr = str2.chars.sort
  str1_arr == str2_arr
end

def second_anagram?(str1, str2) # nested loop so n^2
  s2chars = str2.chars
  str1.chars.each_index do |i1|
    s2chars.each_index do |i2|
      # byebug
      if str1[i1] == s2chars[i2]
        s2chars.delete_at(i2)
        break
      end
    end
  end

  s2chars.empty?
end

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char { |char| str1_hash[char] += 1 }
  str2.each_char { |char| str2_hash[char] += 1 }

  str1_hash == str2_hash
end


def bonus_anagram?(str1, str2)
  chars_hash = Hash.new(0)

  str1.each_char { |char| chars_hash[char] += 1 }
  str2.each_char { |char| chars_hash[char] -= 1 }

  chars_hash.none? { |k,v| v > 0 }
end
