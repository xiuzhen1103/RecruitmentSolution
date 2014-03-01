package recruitment.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.AdministatorDao;
import recruitment.service.AdministratorManager;
@Component("adminManager")
public class AdminManagerImpl implements AdministratorManager{
	private AdministatorDao adminDao;

	@Override
	public boolean login(String username, String password) throws Exception {
		return adminDao.adminAuthentication(username, password);
	}

	public AdministatorDao getAdminDao() {
		return adminDao;
	}
	@Resource
	public void setAdminDao(AdministatorDao adminDao) {
		this.adminDao = adminDao;
	}
	
	

}
