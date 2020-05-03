
load 'ruby_intro_spring20.rb'

def scores
  correct = 0
  wrong = 0
  full = 35

  # Q1
  begin
    move_zeros([1,0,2,8,0,0,7]) == [1,2,8,7,0,0,0] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q2
  begin
    unique_array([1,2,3,-4,-5,1,3,2]) == [1,2,3,-4,-5] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q3
  begin
    group_anagrams(['elbow','cried','below','cider']) == [['elbow','below'],['cried','cider']] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q4
  begin
    valid_palindrome?("A man, a plan, a canal: Panama") == true ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q5
  begin
    unique_char("racecar") == 3 ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q6
  begin
    highest_frequency_word("She says she got married.") == 'she' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  #Q7
  begin
    b2 = Beverage.new("Mocha Latte", 5.89)
  rescue
    b2 = nil
  end

  begin
    b2.formatted_price=="5 dollars and 89 cents only" ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # puts correct+wrong
  puts correct, wrong, correct+wrong
  return ( (correct * full).to_f / (wrong + correct) ).round(2)
end

puts scores
