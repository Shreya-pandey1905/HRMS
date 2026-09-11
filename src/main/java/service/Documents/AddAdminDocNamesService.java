package service.Documents;

import models.Documents.AddAdminDocNames;

import java.util.List;

public interface AddAdminDocNamesService {

    List<AddAdminDocNames> getAll();

    void add(AddAdminDocNames documentName);

    void delete(int id);
}