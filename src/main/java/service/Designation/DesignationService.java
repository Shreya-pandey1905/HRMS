package service.Designation;

import models.Employees.Designation;

import java.util.List;

public interface DesignationService {

    List<Designation> getAllDesignations();

    Designation getDesignationById(int designationId);

    boolean addDesignation(Designation designation);

    boolean updateDesignation(Designation designation);

    boolean deleteDesignation(int designationId);
}