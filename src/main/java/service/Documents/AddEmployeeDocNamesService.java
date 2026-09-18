package service.Documents;

import models.Documents.AddEmployeeDocNames;

import java.util.List;

public interface AddEmployeeDocNamesService {

    List<AddEmployeeDocNames> getAll();

    void add(AddEmployeeDocNames documentName);

    void delete(int id);
}