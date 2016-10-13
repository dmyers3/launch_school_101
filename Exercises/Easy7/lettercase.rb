def letter_case_count(str)
  low_case = str.count("a-z")
  up_case = str.count("A-Z")
  neither = str.length - low_case - up_case
  { lowercase: low_case, uppercase: up_case, neither: neither }
end

p letter_case_count('abCdef 123')
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }