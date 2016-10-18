def get_grade(scr1, scr2, scr3)
  case mean = ((scr1 + scr2 + scr3).to_f)/3
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)