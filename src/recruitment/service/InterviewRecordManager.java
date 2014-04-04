package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.InterviewRecord;

public interface InterviewRecordManager {

    InterviewRecord loadById(Integer InterviewId) throws DataAccessException;

    void addIR(InterviewRecord interviewRecord) throws DataAccessException;

    List<InterviewRecord> loadIRs(InterviewRecord ir) throws DataAccessException;

    boolean update(InterviewRecord ir) throws DataAccessException;
}
