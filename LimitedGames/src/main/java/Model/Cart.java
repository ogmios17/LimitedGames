package Model;

import java.util.ArrayList;

import Model.Gioco.GiocoBean;

public class Cart {
	
	private ArrayList<GiocoBean> games;
	
	public Cart() {
		games= new ArrayList<GiocoBean>();
	}
	
	public void addGame(GiocoBean game) {
		games.add(game);
	}
	
	public void deleteGame(GiocoBean game) {
		for(GiocoBean g: games) {
			if(g.getId()==game.getId()) {
				games.remove(g);
				break;
			}
		}
	}
	
	public ArrayList<GiocoBean> getGames(){
		return games;
	}
}
