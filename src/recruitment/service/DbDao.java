package recruitment.service;

import java.util.List;

public interface DbDao {

	public Object get(Class clazz, int id);
	public void save(Object ob);
	public Object searchOne(String hql, Object... param1);
	public List searchAll(String hql, Object... param1);
	public void delete(Object ob);
}
