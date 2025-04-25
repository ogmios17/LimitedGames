package Model.Utente;

import java.sql.SQLException;
import java.util.Collection;

public interface ProprietaDAOInterface {
	
	public void doSave(ProprietaBean proprieta)throws SQLException;
	public void doDelete(String numero, String username)throws SQLException;
	public Collection<ProprietaBean> doRetrieveByUsername(String username)throws SQLException;
}
