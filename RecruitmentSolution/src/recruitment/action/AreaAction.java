package recruitment.action;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import recruitment.model.Area;
import recruitment.service.AreaManager;

@Component("area")
@Scope("prototype")
public class AreaAction {
	private Area area = new Area();
	private AreaManager am;
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

	public List<Area> getAreas() {
		return areas;
	}
	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
	public String execute() throws Exception{
		am.add(area);
		return "success";
	}

	public String load() throws Exception{
		this.area = this.am.loadByAreaId(area);
		return "load";
	}

	public String delete() throws Exception{
		boolean deleted = am.delete(area);
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
		this.areas = am.listAreas(this.area);
		return "list";
	}
	

	public String update() throws Exception {
		boolean updated = am.update(area);
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
