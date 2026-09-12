

package service.Resignations;

import models.Resignations.Resignation;

import java.util.List;

public interface ResignationService {

    void addResignation(Resignation resignation);

    List<Resignation> getAllResignations();

    Resignation getResignationById(int resignationId);

    void updateResignation(Resignation resignation);

    void deleteResignation(int resignationId);
}
