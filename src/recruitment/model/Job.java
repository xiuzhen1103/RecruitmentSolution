package recruitment.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class Job {
    private Integer jobId = 0;
    private String title;
    private String jobDesc;
    private String address;
    private String phone;
    private Integer numPosition = 0;
    private String requirement;
    private Integer salary = 0;
    private Employer employer;
    private Area countryId;
    private Area countyId;
    private Area districtId;
    private Integer radioList;
    private Integer[] checkboxes;
    private SkillCategory jobCategory;
    private SkillCategory skillCategory;
    private Set<JobSkill> jobSkills = new HashSet<JobSkill>(0);
    private Date createTime = new Date();
    private Boolean isBestMatch;
    private Boolean isApplied;

    @Id
    @GeneratedValue
    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getNumPosition() {
        return numPosition;
    }

    public void setNumPosition(Integer numPosition) {
        this.numPosition = numPosition;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    @ManyToOne
    @JoinColumn(name = "empId")
    public Employer getEmployer() {
        return employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    @ManyToOne
    @JoinColumn(name = "countryId")
    public Area getCountryId() {
        return countryId;
    }

    public void setCountryId(Area countryId) {
        this.countryId = countryId;
    }

    @ManyToOne
    @JoinColumn(name = "countyId")
    public Area getCountyId() {
        return countyId;
    }

    public void setCountyId(Area countyId) {
        this.countyId = countyId;
    }

    @ManyToOne
    @JoinColumn(name = "districtId")
    public Area getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Area districtId) {
        this.districtId = districtId;
    }

    @Transient
    public Integer getRadioList() {
        return radioList;
    }

    public void setRadioList(Integer radioList) {
        this.radioList = radioList;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "job")
    public Set<JobSkill> getJobSkills() {
        return jobSkills;
    }

    public void setJobSkills(Set<JobSkill> jobSkills) {
        this.jobSkills = jobSkills;
    }

    @Transient
    public Integer[] getCheckboxes() {
        return checkboxes;
    }

    public void setCheckboxes(Integer[] checkboxes) {
        this.checkboxes = checkboxes;
    }

    @ManyToOne
    @JoinColumn(name = "jobCategoryId")
    public SkillCategory getJobCategory() {
        return jobCategory;
    }

    public void setJobCategory(SkillCategory jobCategory) {
        this.jobCategory = jobCategory;
    }

    @ManyToOne
    @JoinColumn(name = "skillCategoryId")
    public SkillCategory getSkillCategory() {
        return skillCategory;
    }

    public void setSkillCategory(SkillCategory skillCategory) {
        this.skillCategory = skillCategory;
    }

    @Transient
    public Boolean getIsBestMatch() {
        return isBestMatch;
    }

    public void setIsBestMatch(Boolean isBestMatch) {
        this.isBestMatch = isBestMatch;
    }

    @Transient
    public Boolean getIsApplied() {
        return isApplied;
    }

    public void setIsApplied(Boolean isApplied) {
        this.isApplied = isApplied;
    }

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setCreateTime2(String createTime) {
		if (createTime != null && createTime.length() > 0) {
			SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			try {
				this.createTime = sdf.parse(createTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
}
