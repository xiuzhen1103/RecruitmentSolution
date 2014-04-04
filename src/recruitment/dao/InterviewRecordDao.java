package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.InterviewRecord;

public interface InterviewRecordDao {

    InterviewRecord loadById(Integer InterviewId) throws DataAccessException;

    void save(InterviewRecord interviewRecord) throws DataAccessException;

    List<InterviewRecord> getInterviewRecords(InterviewRecord ir) throws DataAccessException;

    void updateInterviewRecord(InterviewRecord ir) throws DataAccessException;

}
