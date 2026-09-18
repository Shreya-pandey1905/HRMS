package serviceImplementer.Terminations;

import dao.Terminations.TerminationDao;
import models.Terminations.Termination;
import service.Terminations.TerminationService;

import java.util.List;

public class TerminationServiceImpl implements TerminationService {

    private final TerminationDao terminationDao;

    public TerminationServiceImpl() {
        this.terminationDao = new TerminationDao();
    }

    @Override
    public void addTermination(Termination termination) {
        terminationDao.addTermination(termination);
    }

    @Override
    public List<Termination> getAllTerminations() {
        return terminationDao.getAllTerminations();
    }

    @Override
    public Termination getTerminationById(int terminationId) {
        return terminationDao.getTerminationById(terminationId);
    }

    @Override
    public void updateTermination(Termination termination) {
        terminationDao.updateTermination(termination);
    }

    @Override
    public void deleteTermination(int terminationId) {
        terminationDao.deleteTermination(terminationId);
    }
}
