package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import recruitment.dao.InterviewRecordDao;
import recruitment.model.InterviewRecord;
import recruitment.service.InterviewRecordManager;

@Component("irManager")
public class InterviewRecordManagerImpl implements InterviewRecordManager {

    private InterviewRecordDao interviewRecordDao;

    public InterviewRecordDao getInterviewRecordDao() {
        return interviewRecordDao;
    }

    @Resource
    public void setInterviewRecordDao(InterviewRecordDao interviewRecordDao) {
        this.interviewRecordDao = interviewRecordDao;
    }

    @Override
    public InterviewRecord loadById(Integer InterviewId) throws DataAccessException {
        return interviewRecordDao.loadById(InterviewId);
    }

    @Override
    public void addIR(InterviewRecord interviewRecord) throws DataAccessException {
        interviewRecordDao.save(interviewRecord);
    }

    @Override
    public List<InterviewRecord> loadIRs(InterviewRecord ir) throws DataAccessException {
        return interviewRecordDao.getInterviewRecords(ir);
    }

    @Override
    public boolean update(InterviewRecord ir) throws DataAccessException {
        interviewRecordDao.updateInterviewRecord(ir);
        return true;
        
    }

}
