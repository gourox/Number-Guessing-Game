#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:\n"
read USERNAME

#QUERY USERNAME IN DATABASE
QUERY_USERNAME="$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME'")"
#IF NOT FOUND
if [ -z $QUERY_USERNAME ]; then

	#ADD IT INTO DATABASE
	ADD_USERNAME="$($PSQL "INSERT INTO user_info(username,games_played) VALUES('$USERNAME',0)")"
	#ECHO FIRST TIME MESSAGE
	echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
	#SET GAMES_PLAYED TO 0
	GAMES_PLAYED=0
	#SET BEST_GAME TO EMPTY
	BEST_GAME=""

#ELSE QUERY GAMES PLAYED AND BEST GAME
else
	GAMES_PLAYED="$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")"
	BEST_GAME="$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")"
	#OUTPUT WELCOME MESSAGE
	echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#GENERATE SECRET NUMBER
SECRET_NUMBER=$((RANDOM % (1000 - 0 + 1) + 0))

#SET NUMBER OF GUESSES TO 0
NUMBER_OF_GUESSES=0

#ECHO COMMAND
echo -e "Guess the secret number between 1 and 1000:\n"

GAME() {
#READ GUESS
read GUESS

#IF NOT A NUMBER
if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
	#ECHO NOT A NUMBER
	echo -e "That is not an integer, guess again:\n"

	#CALL GAME AGAIN
	GAME
fi

	#IF LOWER THAN SECRET NUMBER
if [[ $GUESS -lt $SECRET_NUMBER ]]; then
	#ECHO
	echo -e "It's higher than that, guess again:\n"
	#INCREMENT NUMBER OF GUESSES
	NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
	#CALL GAME AGAIN
	GAME

#ELSE IF HIGHER THAN SECRET NUMBER
elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
	#ECHO
	echo -e "It's lower than that, guess again:\n"
	#INCREMENT NUMBER OF GUESSES
	NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
	#CALL GAME AGAIN
	GAME

#ELSE
else
	#INCREMENT NUMBER OF GUESSES
	NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

	#INCREMENT GAMES PLAYED AND UPDATE THE DATABASE
	GAMES_PLAYED=$((GAMES_PLAYED + 1 ))
	UPDATE_GAMES_PLAYED="$($PSQL "UPDATE user_info SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")"

	#IF NUMBER OF GUESSES < BEST GAME OR IF BEST GAME IS EMPTY
	if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || -z $BEST_GAME ]]; then
		#UPDATE BEST_GAME
		UPDATE_BEST_GAME="$($PSQL "UPDATE user_info SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")"
	fi
	
fi

}

GAME

#ECHO WIN
echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

