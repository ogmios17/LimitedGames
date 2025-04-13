package Model.Utente;

import java.sql.SQLException;
import java.util.Collection;

import Model.Gioco.GiocoBean;

public interface UtenteDAOInterface {
	
	public void doSave(UtenteBean utente)throws SQLException;
	public void doDelete(String username)throws SQLException;
	public void doUpdate(UtenteBean utente)throws SQLException;
	public UtenteBean doRetrieveByKey(String username)throws SQLException;
	public Collection<UtenteBean> doRetrieveAll(String order)throws SQLException;
}
