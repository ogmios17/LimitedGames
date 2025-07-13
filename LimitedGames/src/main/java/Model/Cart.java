package Model;

import java.util.ArrayList;

import Model.Gioco.GiocoBean;

public class Cart {
	
	private ArrayList<Cartable> games;
	private int objects;
	
	public Cart() {
		games= new ArrayList<Cartable>();
		objects = 0;
	}
	
	public void addGame(Cartable game) {
		for(Cartable c: games) {
			if(c.getGioco().getId()==game.getGioco().getId()) {
				c.quantita+=game.getQuantita();
				objects+= game.getQuantita();
				return;
			}
		}
		games.add(game);
		objects+= game.getQuantita();
	}
	
	public void deleteGame(Cartable game) {
		for(Cartable g: games) {
			System.out.println(g.getGioco().getId()+" "+ game.getGioco().getId()+" "+ g.getPiattaforma()+" "+ game.getPiattaforma());
			if(g.getGioco().getId()==game.getGioco().getId() && g.getPiattaforma().equals(game.getPiattaforma())) {
				games.remove(g);
				objects-=game.getQuantita();
				break;
			}
		}
	}
	
	public void subtractGame(Cartable game) {
		for(Cartable g: games) {
			if(g.getGioco().getId()==game.getGioco().getId() && g.getPiattaforma().equals(game.getPiattaforma())) {
				g.quantita--;
				objects--;
				if(g.quantita==0) {
					deleteGame(g);
				}
				break;
			}
		}
	}
	
	public ArrayList<Cartable> getGames(){
		return games;
	}
	
	public boolean isEmpty() {
		return games.isEmpty();
	}
	
	public int getObjects() {
		return this.objects;
	}
}

