package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.AreaDao;
import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.JobSeeker;

@Component("areaDao")
public class AreaDaoImpl implements AreaDao {
	private HibernateTemplate hibernateTemplate; 

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean deleteArea(final Integer areaId) throws DataAccessException {
		List<Area> areas = hibernateTemplate.find("from Area a where a.areaId = '" + areaId + "'");
		if(areas != null && areas.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete Area a where a.areaId='"+areaId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Area> listCountrys(Area area) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from Area a where 1=1 and level =0 and areaId <> 0 ");
		if(null!=area && area.getAreaId()!=null && area.getAreaId()!=0)  {
			hql.append(" and a.areaId = :areaId");
			map.put("areaId",+ area.getAreaId());
		}
			if(null!= area &&null!=area.getAreaName()&&!"".equals(area.getAreaName())) {
				hql.append(" and LOWER(a.areaName) like LOWER(:areaName) ");
				map.put("areaName","%"+ area.getAreaName()+"%");
			}
			Query query  = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql.toString());
			if (null != map && map.size() >= 1) {
				Iterator<String> it = map.keySet().iterator();
				while (it.hasNext()) {
					String key = it.next();
					query.setParameter(key, map.get(key));
				}
			}
			return query.list();
		}
	
	public List<Area> getAreas(Area area) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from Area a where 1=1 ");
		if(null!=area && area.getAreaId()!=null && area.getAreaId()!=0)  {
			hql.append(" and a.areaId = :areaId");
			map.put("areaId",+ area.getAreaId());
		}
		if(null!= area &&null!=area.getAreaName()&&!"".equals(area.getAreaName())) {
			hql.append(" and LOWER(a.areaName) like LOWER(:areaName) ");
			map.put("areaName","%"+ area.getAreaName()+"%");
		}
			Query query  = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql.toString());
			if (null != map && map.size() >= 1) {
				Iterator<String> it = map.keySet().iterator();
				while (it.hasNext()) {
					String key = (String) it.next();
					query.setParameter(key, map.get(key));
				}
			}
			return query.list();
		}
	
	
	@Override
	public Area loadByAreaId(Integer areaId) throws DataAccessException {
		return (Area) this.hibernateTemplate.load(Area.class, areaId);
	}
	@Override
	public List<Area> loadByCounty(Area area) throws DataAccessException {
		Area countys = this.loadByAreaId(area.getAreaId());
			return countys.getAreas();
	}
	@Override
	public List<Area> loadByAreaName(Area area) throws DataAccessException {
		Area  areas = this.loadByAreaId(area.getAreaId());
		return areas.getAreas();
	}

	@Override
	public void save(Area area) throws DataAccessException {
		hibernateTemplate.save(area);
	}

	@Override
	public boolean updateArea(Integer areaId, String areaName, List<Area> area,
			 String latitude, String longitude)throws DataAccessException {
		Area a = (Area) this.hibernateTemplate.load(Area.class,areaId);
		if(a!=null) {
			a.setAreaName(areaName);
			a.setAreas(area);
			a.setLatitude(latitude);
			a.setLongitude(longitude);
			this.hibernateTemplate.saveOrUpdate(a);
			return true;
		}
		return false;
	}
}
