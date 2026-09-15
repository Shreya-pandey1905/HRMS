package service.Terminations;

import models.Terminations.Termination;

import java.util.List;

public interface TerminationService {

    void addTermination(Termination termination);

    List<Termination> getAllTerminations();

    Termination getTerminationById(int terminationId);

    void updateTermination(Termination termination);

    void deleteTermination(int terminationId);
}
