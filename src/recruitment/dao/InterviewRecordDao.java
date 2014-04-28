package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.InterviewRecord;

public interface InterviewRecordDao {

   public InterviewRecord loadById(Integer InterviewId) throws DataAccessException;
    
   public InterviewRecord loadByJobAndJsAndEmp(Integer jobId, Integer jsId, Integer empId);

   public  void save(InterviewRecord interviewRecord) throws DataAccessException;

   public List<InterviewRecord> getInterviewRecords(InterviewRecord ir) throws DataAccessException;

   public  void updateInterviewRecord(InterviewRecord ir) throws DataAccessException;

   public boolean deleteIr(Integer irId) throws DataAccessException;

}
