#
#  First program in Julia!
#

#=
# welcome user
println("hello, welcome to my first script!")

# ask user aabout their day
println("are you having a nice day? ")

# get response from user
user_response  = readline(stdin)

println("I'm happy that you are having a \"$user_response\" day!")
=#

#=
# get user's favorite number
print("what is your favorite number?")

fav_num = parse(Float64, readline(stdin))


println("Cool! $fav_num is my favorite number, too!")


double_fav_num = fav_num * 2

println("double your number is $double_fav_num")

if double_fav_num > 5
    println("double your number is more than 5!!!")
end
=#

using Printf

# get weight
println("weight?")
weight = parse(Float64, readline(stdin))

println("height?")
height = parse(Float64, readline(stdin))

bmi = (weight/height^2) * 703

println("bmi for the values entered is: $bmi")
Printf.@printf("bmi is %.2f", bmi)

if bmi > 0 && bmi < 18.5
    status = "underweight"
elseif bmi >= 18.5 && bmi < 25.0
    status = "normal"
elseif bmi >= 25.0 && bmi < 30.0
    status = "overweight"
elseif bmi >= 30
    status = "obese"
else
    status = "unknown"
end

println("... the person has a $status bmi")
























#
