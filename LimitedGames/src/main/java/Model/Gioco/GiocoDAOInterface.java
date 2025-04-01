package Model.Gioco;

import java.util.Collection;

public interface GiocoDAOInterface {
	
	public void doSave(GiocoBean gioco);
	public void doDelete(GiocoBean gioco);
	public void doUpdate(GiocoBean gioco);
	public GiocoBean doRetrieveByKey(int id);
	public Collection<GiocoBean> doRetrieveAll(String order);
	
}
