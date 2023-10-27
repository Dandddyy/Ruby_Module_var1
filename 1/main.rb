def calculate_f(a, b, c, x_start, x_end, dx)
  puts "X\t\tF"
  puts "------------------"

  x = x_start
  while x <= x_end
    if a & c | b & c != 0
      f = a * x**2 + b if x < 0 && b != 0
      f = (x - a) / (x - c) if x > 0 && b == 0
      f = x / c if b != 0 && x != 0
      f = f.to_i if (a & c | b & c) == 0
    else
      f = 0
    end

    puts "#{x}\t\t#{f}"
    x += dx
  end
end

puts "Enter a:"
a = gets.to_i

puts "Enter b:"
b = gets.to_i

puts "Enter c:"
c = gets.to_i

puts "Enter starting value X:"
x_start = gets.to_i

puts "Enter final value X:"
x_end = gets.to_i

puts "Enter step dx:"
dx = gets.to_i

calculate_f(a, b, c, x_start, x_end, dx)
