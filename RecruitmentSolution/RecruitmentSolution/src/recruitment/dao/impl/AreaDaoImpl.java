package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
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

	@Override
	public List<Area> getAreas() throws DataAccessException {
		return (List<Area>)this.hibernateTemplate.find("from Area");
	}

	@Override
	public Area loadByAreaId(Integer areaId) throws DataAccessException {
		return (Area) this.hibernateTemplate.load(Area.class, areaId);
	}

	@Override
	public void save(Area area) throws DataAccessException {
		hibernateTemplate.save(area);
	}

	@Override
	public boolean updateArea(Integer areaId, String county, String area,
			String country, String latitude, String longitude)throws DataAccessException {
		Area a = (Area) this.hibernateTemplate.load(Area.class,areaId);
		if(a!=null) {
			a.setCounty(county);
			a.setArea(area);
			a.setCountry(country);
			a.setLatitude(latitude);
			a.setLongitude(longitude);
			this.hibernateTemplate.saveOrUpdate(a);
			return true;
		}
		return false;
	}
}
