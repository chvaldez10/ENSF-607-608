package com.in28minutes.learnspringframework.game;

public class App01GamingBasics {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		var game = new PacmanGame();
		var gameRunner = new GameRunner(game);
		gameRunner.run();
	}

}
