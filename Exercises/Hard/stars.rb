#star(9)
# 1  5   9
#  2 5  8
#idx 5
# 3 spaces * 0 spaces * 0 spaces *

# idx 6
# 2 spaces * 1 space * 1 space * 


def star(int)
  midpoint = int/2
  int.times do |idx|
    if idx == midpoint
      puts '*' * int
    elsif idx < midpoint
      puts ' ' * idx + '*' + ' ' * (midpoint - 1 - idx).abs + '*' + ' ' * (midpoint - 1 - idx).abs + '*'
    else
      puts ' ' * (int - idx - 1) + '*' + ' ' * (idx - midpoint - 1) + '*' + ' ' * (idx - midpoint - 1) + '*'
    end
  end
end

star(9)

# 0 * 4 * 4 *
# 1 * 3 * 3 *