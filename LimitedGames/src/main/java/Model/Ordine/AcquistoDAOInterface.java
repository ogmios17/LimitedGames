package Model.Ordine;

import java.sql.SQLException;
import java.util.Collection;

public interface AcquistoDAOInterface {
	
	public void doSave(AcquistoBean acquisto)throws SQLException;
	public void doDelete(int id)throws SQLException;
	public void doUpdate(AcquistoBean acquisto)throws SQLException;
	public AcquistoBean doRetrieveByKey(int id)throws SQLException;
	public Collection<AcquistoBean> doRetrieveAll(String order)throws SQLException;
	

}
