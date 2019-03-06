# Procedural Ruby Code Challenge

## Objectives
1. Define a method that returns the number elements in an array.
2. Define a method that adds a new hash to an array of hashes.
3. Define a method that prints out information from an array of hashes.

## Instructions
In previous lessons, we learned to use variable, create methods, handle different data structures, and much more. This lab is designed to test you on various concepts that you've learned so far.

We have our `lib` directory which contains the main file you're going to be coding in, `show.rb`. You'll be writing your `#show_count`, `#add_show` and `#print_shows` methods in this file.
Open up `lib/show.rb` and take a look at the shows array you're presented with.

#### The `#show_count` Method
This method should take in an argument of all of our shows and return the number of shows we have in our array.

#### The `#add_show` Method
The `add_show` method takes in three arguments, all of our shows, the name of a new show, and a rating. It should add a new show with the attributes of name and rating to your shows array. Then it should then print out that the show has been added and how many shows are in our array now: `Rick and Morty has been added to the list! You now have 4 show(s) in your list.`. Note: you'll need to use your previously coded method here.

#### The `#print_shows` Method
This method should take in one argument of all shows. It should print out `You have no shows yet, please add some.` if we don't have any shows in our array, but if there are shows in the array, 
it should print out each show with its rating:
```
1. Friends - 9
2. Rick and Morty - 10
```
