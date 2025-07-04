package Model.Gioco;

import java.sql.SQLException;
import java.util.Collection;

public interface GiocoDAOInterface {
	
	public int doSave(GiocoBean gioco)throws SQLException;
	public void doDelete(int Id)throws SQLException;
	public void doUpdate(GiocoBean gioco)throws SQLException;
	public GiocoBean doRetrieveByKey(int id)throws SQLException;
	public Collection<GiocoBean> doRetrieveAll(String order)throws SQLException;
	public Collection<GiocoBean> searchByTitolo(String substring) throws SQLException;
	
}