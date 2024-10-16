

n = 5
a = []
last = nil
[*1..n].each do |no|
  last = a.pop(no -1) if no !=1
  space = no - 1
  a.push ' ' * space + '* ' * (5 - no + 1)
  a.push ' ' * space + '* ' * ((5 - no + 1)) if no != 5
  a+= last if last.present?
end

puts a
