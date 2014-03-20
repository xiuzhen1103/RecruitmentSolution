package recruitment.dao;

import org.springframework.dao.DataAccessException;

import recruitment.model.Administrator;

public interface AdministatorDao {
	public void save(Administrator admin) throws DataAccessException;
	public boolean adminAuthentication(String username, String password) throws DataAccessException;

}
