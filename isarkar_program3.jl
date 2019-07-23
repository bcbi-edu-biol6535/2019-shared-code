# program 3: sets, arrays, and dictionaries

#=
# ask use for a phrase
print("enter a phrase, please? ")
phrase = readline(stdin)

# create an array of words
word_array = [] ### <<< creating the array
word_array = split(phrase, " ") ### loading the array

# print out contents of array
for alfred in word_array
    println("<<<ARRAY WORD>>> $alfred")
end

println("the first two words are: $(word_array[1:2])")
println("the third word is: $(word_array[3])")

# load array into a set
word_set = Set()
for word in word_array
    push!(word_set, word)
end

for word in word_set
    println("<<<WORD IN SET>> $word")
end

# create translation dictionary
translation_dict = Dict()
translation_dict["wheels"] = "tyres"
translation_dict["round"] = "loop-da-loop"

for key in keys(translation_dict)
    println("for \"$key\" the translation is \"$(translation_dict[key])\"")
end

# translate the orignal phrase to the translated version
for oldword in word_array

    if haskey(translation_dict, oldword)
        translated_word = translation_dict[oldword]
        print("$translated_word ")
    else
        print("$oldword ")
    end


end

println()

=#
##### BEGIN CLASS EXERCISE
## Until the user types "stop,stop", ask the user for translations as key, value
## pairs that will be used to convert phrases later. Then:
##		(1) Reports the keys in the order that they were entered
##		(2) Reports the unique list of keys
##		(3) Asks the user for 3 words to translate, and reports the translation

# ask user for key/value pair as "key,value"
print("enter a translation (as \"key,value\"):")
key_val_pair = readline(stdin)

key_array = []
key_set = Set()
translate_dict = Dict()

# process key-value pairs
while key_val_pair != "stop,stop"
    println("processing $key_val_pair")

    # split input string into an array
    key_val_array = split(key_val_pair, ",")
    key = key_val_array[1]
    val = key_val_array[2]

    # keep track of keys in order (array)
    push!(key_array, key)

    # keep track of unique keys not in order (set)
    push!(key_set, key)

    # load key-value pair into dictionary
    translate_dict[key] = val

    # ask for the next phrase
    print("enter another translation (as \"key,value\"):")
    global key_val_pair = readline(stdin)

end

# tell user keys in order
println("the keys in order are:")
for key in key_array
    println(key)
end

# report unique keys
println("the unique set of keys is:")
for key in key_set
    println(key)
end

for word_count in 1:3

    # asked user for phrase to translate
    println("give me a key to translate:")
    user_phrase = readline(stdin)

    if haskey(translate_dict, user_phrase)
        # report the translation
        println("that translates to: $(translate_dict[user_phrase])")
    else
        println("no idea how to translate that! ")
    end












































#
