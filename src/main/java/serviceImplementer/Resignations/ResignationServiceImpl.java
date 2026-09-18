package serviceImplementer.Resignations;

import dao.Resignations.ResignationDao;
import models.Resignations.Resignation;
import service.Resignations.ResignationService;

import java.util.List;

public class ResignationServiceImpl implements ResignationService {

    private final ResignationDao resignationDao;

    public ResignationServiceImpl() {
        this.resignationDao = new ResignationDao();
    }

    @Override
    public void addResignation(Resignation resignation) {
        resignationDao.addResignation(resignation);
    }

    @Override
    public List<Resignation> getAllResignations() {
        return resignationDao.getAllResignations();
    }

    @Override
    public Resignation getResignationById(int resignationId) {
        return resignationDao.getResignationById(resignationId);
    }

    @Override
    public void updateResignation(Resignation resignation) {
        resignationDao.updateResignation(resignation);
    }

    @Override
    public void deleteResignation(int resignationId) {
        resignationDao.deleteResignation(resignationId);
    }
}
