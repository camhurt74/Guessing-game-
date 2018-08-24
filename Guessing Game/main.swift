//
//  main.swift
//  Guessing Game
//
//  Created by Cameron Hurt on 8/21/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

var congrats = ["Congrats you got it!", "You win!", "Correct number!"]
var fail = ["Sorry you ran out of tries, :( the number is ", "Incorrect, the number is ", "Not quite, the number is "]
var tooHigh = ["too high", "Your number is too high","Your number is too big"]
var tooLow = ["Too low", "Your number is too low", "Your number is too small"]

//Variable that determines whether or not we're still playing the game
var playingGame = true

//This loop will run while we're playing the game
repeat {
    //This is the random number that we have generated. We cast it from a UInt32 to an Int
    let randomNumber = Int(arc4random_uniform(1001))
    
    
    //This is the number of guesses a user has to get it right
    var numberOfGuesses = 8
    
    //Welcome the user and prompt them for input
    print("Welcome to the guessing game!")
    print("Please guess a number between 0 and 1000.")
    var userGuess = Int(readLine()!)
    
    //Input Validation
    while userGuess == nil {
        //Prompt the user to enter a valid number
        print("Please enter a valid number.")
        //Get user input again
        userGuess = Int(readLine()!)
    }
    
    //Make another if statement that says if the user's guess is not equal to the random number, print out whether the guess is too high or too low.
    if userGuess != randomNumber {
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            numberOfGuesses -= 1
            print("You have \(numberOfGuesses) tries remaining")
            
    if userGuess! > randomNumber {
                let randomIndex3 = Int(arc4random_uniform(UInt32(congrats.count)))
                let randomItem3 = tooHigh[randomIndex3]
                print(randomItem3)
            } else if userGuess! < randomNumber {
            let randomIndex2 = Int(arc4random_uniform(UInt32(congrats.count)))
                let randomItem2 = tooLow[randomIndex2]
                print(randomItem2)
            }
            print("Guess another number")
            userGuess = Int(readLine()!)
    
        }
    }
    if numberOfGuesses == 1 && userGuess != randomNumber {
        let randomIndex1 = Int(arc4random_uniform(UInt32(congrats.count)))
        let randomItem1 = fail[randomIndex1]
        print(randomItem1, "\(randomNumber)")
        print("Would you like to play again? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
            stillPlaying = readLine()!
        }
        if stillPlaying == "N" {
            Print("Thank you for playing!")
            playingGame = false
        }
    }
    //Check to see if the user guess is equal to the random number.
    if userGuess == randomNumber {
        //Tell the user they won and ask them if they want to play again
        let randomIndex = Int(arc4random_uniform(UInt32(congrats.count)))
        let randomItem = congrats[randomIndex]
        print(randomItem)
        print("Would you like to play again? Y/N")
        
        //Get user input to check
        var stillPlaying = readLine()!.uppercased()
        //If they HAVEN'T entered a Y or an N, keep asking them for input until they do
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
            stillPlaying = readLine()!.uppercased()
        }
        
        //If they entered an N, set playingGame to false (which will end the game
        if stillPlaying == "N" {
            print("Thank you for playing!")
            playingGame = false
        }
    }
} while playingGame == true



