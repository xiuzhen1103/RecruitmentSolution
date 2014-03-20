package recruitment.service;

import recruitment.model.Administrator;

public interface AdministratorManager {
	public boolean login(String username, String password) throws Exception;

}
