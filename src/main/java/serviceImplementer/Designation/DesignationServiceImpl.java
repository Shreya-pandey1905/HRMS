package serviceImplementer.Designation;

import dao.Designation.DesignationDao;
import models.Employees.Designation;
import service.Designation.DesignationService;

import java.util.List;

public class DesignationServiceImpl implements DesignationService {

    private DesignationDao designationDao;

    public DesignationServiceImpl() {
        designationDao = new DesignationDao();
    }

    @Override
    public List<Designation> getAllDesignations() {

        return designationDao.getAllDesignations();
    }

    @Override
    public Designation getDesignationById(int designationId) {

        return designationDao.getDesignationById(designationId);
    }

    @Override
    public boolean addDesignation(Designation designation) {

        return designationDao.addDesignation(designation);
    }

    @Override
    public boolean updateDesignation(Designation designation) {

        return designationDao.updateDesignation(designation);
    }

    @Override
    public boolean deleteDesignation(int designationId) {

        return designationDao.deleteDesignation(designationId);
    }
}