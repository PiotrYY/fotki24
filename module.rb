
# def method (array)
# tablica=[]
#         array.each do |x|
#
#         if x%4==0 && x%3==0
#
#           tablica << '3 i 4'
#
#         elsif x%3==0
#           tablica << '3'
#
#         elsif x%4 ==0
#
#           tablica << '4'
#
#         else
#           puts "coś"
#         end
# end
# tablica
# end
#
# puts method([12,3,4])


# def method(array)
#   result = []
#   array.each do |a|
#     val3 = a%3 == 0
#     val4 = a%4 == 0
#
#     if val3 && val4
#       result << '3=4'
#     elsif val3
#       result << '3'
#     elsif val4
#       result << '4'
#     else
#       result << '0'
#     end
#   end
#
#   result
# end
#
# p method([12, 2, 7, 10, 2, 12, 8])
#
# # ciąg fibonaciego
# def fib_naive(n)
#   value = 0
#   f1 = 1
#   f2 = 1
#   return 0 if n == 0
#   return 1 if n == 1 || n == 2
#
#   (n-2).times do
#     value = f1 + f2
#     f1 = f2
#     f2 = value
#   end
#
#   value
# end
# ciąg fibonaciego  rekurencyjnej
# def fib_recursive(n)
#   puts n
#   return 0 if n == 0
#   return 1 if n == 1
#   fib(1-2) + fib(n-1)
# end
# # przykład funkcji rekurencyjnej
# def abc(word)
#   puts word
#   abc(word)
# end


# tablica =[3,4,5,6,8,4]
#
# tablica.each do |x|
#   if tablica[x]<tablica[x+1]
#     tablica[x], tablica[x+1] = tablica[x+1], tablica[x]
#   end
#
# end
