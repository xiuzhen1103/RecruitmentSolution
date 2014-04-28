package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.InterviewRecord;

public interface InterviewRecordManager {

    public InterviewRecord loadById(Integer InterviewId) throws DataAccessException;

    public InterviewRecord loadByJobAndJsAndEmp(Integer jobId, Integer jsId, Integer empId) throws DataAccessException;

    public  void addIR(InterviewRecord interviewRecord) throws DataAccessException;

    public List<InterviewRecord> loadIRs(InterviewRecord ir) throws DataAccessException;

    public boolean update(InterviewRecord ir) throws DataAccessException;
    
    public boolean delete(InterviewRecord ir) throws DataAccessException;
}
