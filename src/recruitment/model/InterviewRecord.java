package recruitment.model;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class InterviewRecord {
    private Integer interviewId;
    private Employer em;
    private JobSeeker js;
    private Job job;
    private CV cv;
    private String interviewTime;
    private String phone;
    private String memo;
    private Integer status;
    private Date createTime = new Date();

    @Id
    @GeneratedValue
    public Integer getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(Integer interviewId) {
        this.interviewId = interviewId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empId", nullable = false)
    public Employer getEm() {
        return em;
    }

    public void setEm(Employer em) {
        this.em = em;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "jsId", nullable = false)
    public JobSeeker getJs() {
        return js;
    }

    public void setJs(JobSeeker js) {
        this.js = js;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "jobId", nullable = false)
    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cvId", nullable = false)
    public CV getCv() {
        return cv;
    }

    public void setCv(CV cv) {
        this.cv = cv;
    }

    public String getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(String interviewTime) {
        this.interviewTime = interviewTime;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
