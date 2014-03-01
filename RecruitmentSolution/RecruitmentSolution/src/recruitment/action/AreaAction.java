package recruitment.action;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.service.AreaManager;
import recruitment.vo.AreaInfo;

@Component("area")
@Scope("prototype")
public class AreaAction {
	private Area area;
	private AreaManager am;
	private AreaInfo areaInfo;
	private String message="";
	private List<Area> areas;

	public AreaManager getAm() {
		return am;
	}
	@Resource(name="areaManager")
	public void setAm(AreaManager am) {
		this.am = am;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	
	public AreaInfo getAreaInfo() {
		return areaInfo;
	}
	public void setAreaInfo(AreaInfo areaInfo) {
		this.areaInfo = areaInfo;
	}
	public List<Area> getAreas() {
		return areas;
	}
	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
	public String execute() throws Exception{
		Area area = new Area();
		BeanUtils.copyProperties(areaInfo, area);
		am.add(area);
		return "success";
	}
	
	public String loadById() throws Exception{
		this.area = this.am.loadByAreaId(areaInfo.getAreaId());
		return "load";
	}
	
	public String delete() throws Exception{
		boolean deleted = am.delete(areaInfo.getAreaId());
		if(deleted) {
			message="delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, Employer id is not exist";
			return "fail";
		}
	}
	
	public String list() throws Exception {
		this.areas = am.getAreas();
		return "list";
	}
	
	public String update() throws Exception {
		boolean updated = am.update(areaInfo.getAreaId(), areaInfo.getCounty(), areaInfo.getArea(), areaInfo.getCountry(), areaInfo.getLatitude(), areaInfo.getLongitude());
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}
		}
		

}
