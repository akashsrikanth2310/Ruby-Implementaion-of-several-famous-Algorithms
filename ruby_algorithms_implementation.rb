# Part 1

def move_zeros(a)
  # ADD YOUR CODE HERE
  #
    non_zero_values_counter = 0                                          #Counter to count the number of non zero values in array
    length = a.length
    index = 0
    while index < length
       if a[index] != 0                                                  #Check if value at the position is 0
          a[non_zero_values_counter] = a[index]                          #adding the value the before the zero values
          non_zero_values_counter = non_zero_values_counter + 1
       end
       index = index + 1
    end

    while non_zero_values_counter < length
          a[non_zero_values_counter] = 0                                 #isnerting all the zero values at the end
          non_zero_values_counter = non_zero_values_counter + 1
    end
    return a

end

def unique_array(a)
  # ADD YOUR CODE HERE
  a = a.uniq                                                              #returns the array containing all the unique values
end


def group_anagrams(a)
  # ADD YOUR CODE HERE
  generatinganagram = Hash.new {|h, k| h[k] = []}                         #creating a hashmap with a list of values to keys
  for string in a
    counter = 0
    pre = string.chars                                                    #converting the string into chars
    arrange = pre.sort                                                    #sort the characters
    generatinganagram[arrange].push(string)                               #adding the values to the hashmap
  end
  return generatinganagram.values
end


# Part 2

def valid_palindrome?(s)
  # ADD YOUR CODE HERE
  if s==s.reverse #Checking if the string reverse is the same as the given string.
    return true                                                           #returns true if palindrome
  else
    return false                                                          #returns false if not
  end
end


def unique_char(s)
  # ADD YOUR CODE HERE
  lettercount = Hash.new(0)                                               #creates hashmap for lettercounts
  s.each_char do |charac|
    lettercount[charac] += 1                                              #if it sees a character it increments its count
  end
  i = 0
  s.each_char do |charac|
    value = lettercount[charac]                                           #checks the count of each character
    if value == 1                                                         #checks if values is 1 which means non repeating
      return i                                                            #returns the value
    end
    i = i+1
  end
  return -1
end


def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  if s.empty?                                                             #returns if string is empty
    return
  end
  words = s.split(/\W+/)                                                  #splits the string in words
  wordcount = Hash.new(0)                                                 #creates hashmap for words in string
  for word in words
    wordcount[word] += 1                                                  #increases count of words encountered
  end
  maximum = 0
  for word in words
    value = wordcount[word]
    if value > maximum
      maximum = value                                                     #finds the maximum value for the word count
    end
  end
  for word in words
    value = wordcount[word]
    if value == maximum                                                   #checks if the words value is maximum
      return word.downcase                                                #returns the word when it is maximum
    end
  end


end

print(highest_frequency_word("A man was painting a new sign for the pub called the Pig and Whistle"))

# Part 3

class Beverage
  #the constructor to initialize
  def initialize(name = NIL, price = 0)
    #checking if 'name' is NIL or String or empty
    if name.nil? or !name.is_a?(String) or name.empty?
      raise ArgumentError.new("Nil and empty strings are not allowed for name attribute")
    end
    #checking if 'price' is NIL or non-positive value
    if price.nil? or price <= 0
      raise ArgumentError.new("Nil or non-positive values are not allowed for price attribute")
    end
    #changing the precision of the price value to 2 digits
    price = "%0.2f" %price
    #the instance variables
    @name = name
    @price = price
  end
  #the 'name' getter
  def get_name
    @name
  end
  #the 'name' setter
  def set_name=(name)
    @name = name
  end

  #the price getter
  def get_price
    @price
  end
  #the price setter
  def set_price=(price)
    #changing the precision of the price value to 2 digits
    price = "%0.2f" %price
    @price = price
  end

  #formatted_price method
  def formatted_price
    #splitting the values by decimals to get dollars and cents
    price_dollars, price_cents =  @price.to_s.split(".")
    price_dollars = price_dollars.to_i.to_s
    price_cents = price_cents.to_i.to_s
    #puts price_dollars, price_cents
    # checking if cents are NIL
    if price_cents == "0"
      price_words = price_dollars + " dollars only"  if price_dollars != "1"
      price_words = price_dollars + " dollar only" if price_dollars == "1"

      #checking if dollars are NIL
    elsif price_dollars == "0"
      price_words = price_cents + " cents only" if price_cents != "1"
      price_words = price_cents + " cent only" if price_cents == "1"
      #both of them are not NIL
    else
      price_words = price_dollars + " dollars" if price_dollars != "1"
      price_words = price_dollars + " dollar" if price_dollars == "1"
      price_words += " and "
      price_words += price_cents + " cents" if price_cents != "1"
      price_words += price_cents + " cent" if price_cents == "1"
      price_words += " only"
    end
    price_words
  end
end
